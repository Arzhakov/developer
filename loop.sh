#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   echo "This script endlessly repeats the specified command at the specified frequency."
   echo
   echo "arguments:"
   echo "c     Repeat this command"
   echo "p     Pause in seconds (default=1)"
   echo "h     Print this Help."
   echo
   echo "example:"
   echo "Repeat: call wallpaper.sh and wait for 5 seconds"
   echo "./loop.sh -c ./wallpaper.sh -p 5"
}

PAUSE=1

while getopts "c:p:h" opt; do
  case $opt in
    c) COMMAND="$OPTARG"
    ;;
    p) PAUSE="$OPTARG"
    ;;
    h) Help
    exit 0
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

echo "COMMAND:"
echo $COMMAND
echo "PASUE:"
echo $PAUSE
echo "let's go!"

COUNTER=1
while true
do  
  echo "Loop#"$COUNTER
  
  if [ -z "$COMMAND" ] 
  then
	Help
  else
	$COMMAND
  fi
  
  sleep $PAUSE
  
  COUNTER=$((COUNTER+1))
done
