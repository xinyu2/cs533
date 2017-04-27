#!/bin/bash
if [[ -e data/d_10_15 ]]; then
    echo 'file "d_10_15" exists.'
else
    echo 'file "d_10_15" not exists.'
fi

d[0]=d_10_15
d[1]=d_90_2000
d[2]=d_100_4900
d[3]=d_1000_499500


red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
reset=`tput sgr0`

for i in {0..3}; do
    echo "${yellow}run" "$i" "data\(${d[i]})" "${green}=========================================>>>${reset}"
    ./g "data/${d[i]}" >> output/og"$i"
done

cat output/og* >> output/go
rm output/og*
cat output/go
