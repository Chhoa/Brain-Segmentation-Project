#!/bin/bash

#DIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/ADNI_013batch013_S_1035

for subfolder in ${DDIR}/*; do
mkdir -p "${subfolder}/Seg_MALPEM"
 for file in ${subfolder}/*.nii; do
 fname=$(basename "$file")  
  for folder in "${subfolder}/Seg_MALPEM"/*; do 
    if [ "$fname" != "${folder%%[.]*}" ]; then
    echo "$file"
    fi
  done
 done 
done
