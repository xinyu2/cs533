#!/bin/bash
if [[ -e data/d_10_15 ]]; then
    echo 'file "rg" exists.'
else
    echo 'file "rg" not exists.'
fi

nn[0]=1
nn[1]=2
nn[2]=4
nn[3]=8
nn[4]=16
nn[5]=32
nn[6]=64
nn[7]=128
nn[8]=256
nn[9]=512
nn[10]=1024

ne[0]=0
ne[1]=1
ne[2]=2
ne[3]=4
ne[4]=8
ne[5]=16
ne[6]=32
ne[7]=64
ne[8]=128
ne[9]=256
ne[10]=512
ne[11]=1024
ne[12]=2048
ne[13]=4096
ne[14]=8192
ne[15]=16384
ne[16]=32768
ne[17]=65536
ne[18]=131072
ne[19]=262144
ne[20]=523766

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
reset=`tput sgr0`

for i in {0..10}; do
    echo "${yellow}run" "$i" "node(${nn[i]})" "${green}=========================================>>>${reset}"
    ((tmp=nn[i]-1))
    ((maxne=nn[i]*tmp/2))
    for j in {0..20}; do
        if [ "${ne[j]}" -le "$maxne" ]; then
            ./rg "${nn[i]}" "${ne[j]}" >> data/d_"${nn[i]}"_"${ne[j]}"
        else
            ./rg "${nn[i]}" "$maxne" >> data/d_"${nn[i]}"_"$maxne"
        fi
    done
done
