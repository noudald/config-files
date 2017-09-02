#!/bin/sh

FILES="$(git ls-tree --name-only HEAD .)"
MAXLEN=0
IFS="$(printf "\n\b")"
for f in $FILES; do
    if [ ${#f} -gt $MAXLEN ]; then
        MAXLEN=${#f}
    fi
done

unsorted_string=""
for f in $FILES; do
    str="$(git log -1 --pretty=format:"%C(green)%ct%Creset %C(cyan)%h%Creset %s %C(yellow)(%cn)%Creset %C(red)(%cr)%Creset" $f)"
    unsorted_string="${unsorted_string}$(printf "%-${MAXLEN}s -- %s" "$f" "$str")\n"
done
printf $unsorted_string | sort -k2 -r
