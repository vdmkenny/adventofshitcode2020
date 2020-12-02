#!/bin/bash


parsepolicy_part1(){
    local policy=$1
    local minOcc=$(echo $policy | cut -d "-" -f 1)
    local maxOcc=$(echo $policy | cut -d "-" -f 2 | cut -d " " -f 1)
    local passChar=$(echo $policy|cut -d " " -f 2 | cut -d ":" -f 1)
    local password=$(echo $policy|cut -d " " -f 3)
    local occurences=$(echo "${password}" | awk -F"${passChar}" '{print NF-1}')

    if (($occurences >= $minOcc && $occurences <= $maxOcc)); then
      policyMatches=$(($policyMatches + 1))
    fi
}

parsepolicy_part2(){
    local policy=$1
    local pos1=$(echo $policy | cut -d "-" -f 1)
    local pos2=$(echo $policy | cut -d "-" -f 2 | cut -d " " -f 1)
    local passChar=$(echo $policy|cut -d " " -f 2 | cut -d ":" -f 1)
    local password=$(echo $policy|cut -d " " -f 3)
    local char1=$(echo ${password:$(($pos1 - 1)):1})
    local char2=$(echo ${password:$(($pos2 - 1)):1})

    if [ "$char1" == "$passChar" ] && [ "$char2" != "$passChar" ]; then
      policyMatches=$(($policyMatches + 1))
    elif [ "$char1" != "$passChar" ] && [ "$char2" == "$passChar" ]; then
      policyMatches=$(($policyMatches + 1))
    else
      echo "$policy didn't match"
      echo "$pos1:$char1 $pos2:$char2"
    fi
}


policyMatches=0
while IFS= read -r line
do
  parsepolicy_part1 "$line"
done < input

echo "$policyMatches matched policy from part1."

policyMatches=0
while IFS= read -r line
do
  parsepolicy_part2 "$line"
done < input

echo "$policyMatches matched policy from part2."
