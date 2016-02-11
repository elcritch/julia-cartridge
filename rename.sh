#!/bin/sh

echo "Renames user in text and config files. Warning: will edit all files. " 

IN=${1:-elcritch}
OUT=${2:-elcritch}

find * -type f -exec grep -Iq . {} \; -and -exec sed -i.bak_sed -e s/$IN/$OUT/g {} \; && find . -type f -name "*.bak_sed" -exec rm {} \; ;


