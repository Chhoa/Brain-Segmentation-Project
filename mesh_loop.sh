#!/bin/bash

dir="/project/mang/data/ADNI_test"

for d1 in "$dir"/*; do
  for d2 in "$d1"/*Seg_MALPEM; do
    for file in "$d2"/[RL]V_*; do
        filename=$(basename "$file" .nii.gz)
        outputfile="$d2/${filename}_mesh.vtk"
        ./mesh_ITK "$file" "$outputfile"
    done
  done
done

