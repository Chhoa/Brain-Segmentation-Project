#!/bin/bash

dir="/project/mang/data/ADNI_test"

for d1 in "$dir"/*; do
  for d2 in "$d1"/M*; do
  #if [ "$d2" != "Seg_MALPEM" ]; then
    for d3 in "$d2"/*; do
      for d4 in "$d3"/*; do
        for file in "$d4"/*.nii; do
          #name1=$(basename "$d1")
          #name2=$(basename "$d3")
          #ln -s "$file" "$d1/${name1}_${name2}.nii"
          #fname=$(basename "$file")
          #zip "$fname".gz "$file"
          #echo $file
          gzip -v $file
        done
      done
    done
  #fi
  done
done
