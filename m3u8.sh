#!/bin/bash
Help()
{
  echo "This script saves m3u8 to computer using ffmpeg, no questions asked."
  echo
  echo "arguments:"
  echo "i     input"
  echo "o     output"
  echo "h     Print this Help."
  echo
  echo "example:"
  echo "./m3u8.sh -i http://.../playlist.m3u8 -o output.mp4"
}

Countdown()
{
  for I in 3 2 1
  do
    echo $I"..."
    sleep 1    
  done
  echo "let's go!"
}

while getopts "i:o:h" opt; do
  case $opt in
    i) INPUT="$OPTARG"
    ;;
    o) OUTPUT="$OPTARG"
    ;;
    h) Help
    exit 0
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [ -z "$OUTPUT" ]
then
  NOW=$(date +"%Y_%m_%d_%H_%M_%S")
  OUTPUT=./out_m3u8_$NOW.mp4
fi

if [ -z "$INPUT" ]
then
  Help
else
  echo "INPUT:"
  echo $INPUT
  echo "OUTPUT:"
  echo $OUTPUT
  Countdown
  ffmpeg -i $INPUT -c copy -bsf:a aac_adtstoasc $OUTPUT
  echo Goodbye!
fi
