#!/bin/bash

dir="/project/mang/data/ADNI_test2"

for d1 in "$dir"/*; do
  ##for d2 in "$d1"/*Seg_MALPEM; do
      for file in "$d1"/*_MALPEM.nii.gz; do
      filename=$(basename "$file" .nii.gz)
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA('$file', '$d1'); exit"
    done
done
