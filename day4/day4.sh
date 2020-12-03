#!/bin/bash

lines=$(cat input)
index=3
trees=0
linenum=0

for line in $lines; do
    if (($linenum > 0)); then
        if [ "${line:$index:1}" == "#" ]; then
            trees=$(($trees + 1))
        fi
	for i in {1..3}; do
        index=$(($index + 1))
            if (($index > 30)); then
                index=0
            fi
        done
    fi
    linenum=$(($linenum + 1))
done

echo "Ouchie, I hit $trees trees on my way down in part1!"
