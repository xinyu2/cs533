#!/bin/bash
if [[ -e data/d_10_15 ]]; then
    echo 'file "r" exists.'
else
    echo 'file "r" not exists.'
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
    for it in {1..10}; do
        ((i=i+1))
        echo "${yellow}run" "$i" "($f)" "${green}=========================================>>>${reset}"
        ./r "$f" "$it" >> output/or"$i"
        sleep 0.5
    done
done

cat output/or* >> output/ro
rm output/or*
cat output/ro
