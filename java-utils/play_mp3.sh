#!/bin/bash
MP3FILE=$1
VOLUME=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
amixer set 'Master' 90%
ffplay ${MP3FILE} -autoexit
amixer set 'Master' ${VOLUME}
