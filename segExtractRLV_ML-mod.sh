#!/bin/bash

module load matlab
dir="/project/mang/data/ADNI_test"

for d1 in "$dir"/*; do
  ##for d2 in "$d1"/*Seg_MALPEM; do
      for file in "$d1"/*_MALPEM.nii.gz; do
      #filename=$(basename "$file" .nii.gz)
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '$d1'); exit"
    done
done
