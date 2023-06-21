#!/bin/bash

module load matlab
dir="/project/mang/data/ADNI_data+results"

for d1 in "$dir"/*; do
      for file in "$d1"/*_MALPEM.nii.gz; do
      fname=$(basename "$file" .nii.gz)
      vname=LV_$fname-cca.nii.gz
      if [ ! -f $d1/$vname ]; then
      echo $file
      #matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '$d1'); exit"
fi    
done
done
