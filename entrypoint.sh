#!/bin/sh

path=${INPUT_PATH}
mask=${INPUT_REGEX:-"\.(heic|heif)$"}
ext=${OUTPUT_EXT:-jpg}
nice=${PROCESS_NICE:-10}

cd /input

find "./$path" -type f | egrep -i "$mask" | sort | cut -c 3- | while read input
do

	output="/output/${input%.*}.$ext"
	mkdir -p "$(dirname "$output")"
	nice -n $nice ffmpeg -n -hide_banner -v info -i "$input" "$@" "$output" < /dev/null || true
	nice -n $nice exiftool -overwrite_original -TagsFromFile "$input" "-all:all>all:all" "$output" < /dev/null || true
	nice -n $nice touch --reference="$input" "$output" < /dev/null || true

done
