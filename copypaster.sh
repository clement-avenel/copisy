#!/bin/bash
function ProgressBar {
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}
printf "\n ██████  ██████  ██████  ██ ███████ ██    ██ \n██      ██    ██ ██   ██ ██ ██       ██  ██  \n██      ██    ██ ██████  ██ ███████   ████  \n██      ██    ██ ██      ██      ██    ██  \n ██████  ██████  ██      ██ ███████    ██    \nProbably the easiest way to copy paste things.\nMade with ❤ by Clément Avenel\n\n"
echo Insert the line you want to copy:
read s
len=$(expr length $s)
copiedString=''
echo Copying each character :
for number in $(seq 0 ${len})
do
    sleep 0.1
    ProgressBar ${number} ${len}
done
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo $s | xclip
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo $s | pbcopy
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo $s | clip.exe
elif [[ "$OSTYPE" == "msys" ]]; then
  echo $s | clip.exe
elif [[ "$OSTYPE" == "win32" ]]; then
  echo $s | clip.exe
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo $s | clip.exe
else
  echo $s | clip.exe
fi
printf '\nDone!\n'
sleep 5
