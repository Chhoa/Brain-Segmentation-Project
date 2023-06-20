#!/bin/bash

dir="/project/mang/data/ADNI_data+results"

for d1 in "$dir"/*; do
  for d2 in "$d1"/*Seg_MALPEM; do
    for d3 in "$d2"/*; do
      for file in "$d3"/*_MALPEM.nii.gz; do
        ##ln -s "$file" "$d1/$(basename "$d2")/"
        ln -s "$file" "$d1/"
      done
    done
  done
done

