#!/bin/bash
if [[ -e data/d_10_15 ]]; then
    echo 'file "g" exists.'
else
    echo 'file "g" not exists.'
fi
FILES=data/*

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
reset=`tput sgr0`
i=0

for f in $FILES; do
    ((i=i+1))
    echo "${yellow}run" "$i" "($f)" "${green}=========================================>>>${reset}"
    ./g "$f" >> output/og"$i"
    sleep 0.5
done

cat output/og* >> output/go
rm output/og*
cat output/go
