#!/bin/bash

dir="/project/mang/data/ADNI_014results"

for d1 in "$dir"/*; do
  for d2 in "$d1"/M*; do
  #if [ "$d2" != "Seg_MALPEM" ]; then
    for d3 in "$d2"/*; do
      for d4 in "$d3"/*; do
        for file in "$d4"/*; do
          name1=$(basename "$d1")
          name2=$(basename "$d3")
          ln -s "$file" "$d1/${name1}_${name2}.nii"
          ###gzip "$d1/${name1}_${name2}.nii"
          ###mkdir "$d1/${name1}_${name2}MALPEM"
        done
      done
    done
  #fi
  done
done

