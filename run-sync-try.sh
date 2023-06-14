#!/bin/bash

#DIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/ADNI_013batch

for subfolder in ${DDIR}/013_S_10*; do
mkdir -p "${subfolder}/Seg_MALPEM" 
 for file in ${subfolder}/*.nii; do
 fname=$(basename "$file" .0.nii)
 #i=0; j=0
 match=0 
  for folder in "${subfolder}/Seg_MALPEM"/*; do
  #j=$((j + 1)) 
  fdname=$(basename "${folder%%[.]*}")
    if [ "$fname" = "$fdname" ];
    #then break;
    #else i=$((i + 1))
    then match=1
    fi
  done
  #echo $i $j
  #if [ $i = $j ]; then
  if [ $match = 0 ]; then
  echo "$file"
  fi
done 
done
