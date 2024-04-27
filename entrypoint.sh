#!/bin/sh
#sleep 2147483647

path="${INPUT_PATH}"
mask="${INPUT_REGEX:-\.(heic|heif)$}"
ext="${OUTPUT_EXT:-jpg}"
nice="${PROCESS_NICE:-10}"
filescount=0
processedfilescount=0
skippedfilescount=0

cd /input || exit 1

while IFS= read -r input; do
    output="/output/${input%.*}.$ext"

    if [ ! -f "$output" ]; then
        echo "inside"
        mkdir -p "$(dirname "$output")"
        nice -n "$nice" ffmpeg -n -hide_banner -v info -i "$input" "$@" "$output" < /dev/null || true
        nice -n "$nice" exiftool -overwrite_original -TagsFromFile "$input" "-all:all>all:all" "$output" < /dev/null || true
        nice -n "$nice" touch --reference="$input" "$output" < /dev/null || true

        processedfilescount=$((processedfilescount+1))
    else
        echo "File already exists, skipping: $output"
        skippedfilescount=$((skippedfilescount+1))
    fi
    filescount=$((filescount+1))
done << EOF
$(find "./$path" -type f | egrep -i "$mask" | sort | cut -c 3-)
EOF

echo "Finished. Total images: ${filescount}. Processed: ${processedfilescount}. Skipped files: ${skippedfilescount}"
