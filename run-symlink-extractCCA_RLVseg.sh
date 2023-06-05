#!/bin/bash

dir="/project/mang/data/ADNI_test"

#symlinking MALPEM segmentations:

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

#extracting left and right ventricles using cca in MATLAB:
module load matlab

for d1 in "$dir"/*; do
    for file in "$d1"/*_MALPEM.nii.gz; do
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '$d1'); exit"
    done
done
