#!/bin/bash

dir="/project/mang/data/ADNI_test"

for d1 in "$dir"/*; do
  for file in "$d1"/[RL]V_*; do
    filename=$(basename "$file" .nii.gz)
    outputfile="${filename}_mesh.vtk"
    ./mesh_ITK "$file" "$d1/$outputfile"
  done
done

