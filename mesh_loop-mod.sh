#!/bin/bash

module load cmake

cd /project/mang/chhoa/mesh1_ITK/build
dir="/project/mang/data/test011_S_0861"

for d1 in "$dir"/*; do
    for file in "$d1"/[RL]V_*_MALPEM.nii.gz; do
    #for file in "$d1"/{cca*,binary*}; do

    fname=$(basename "$file" .nii.gz)
    vname=$fname-cca.nii.gz

    if [ ! -f $d1/$vname ]; then

    #echo $file
    #filename1=$(basename "$file" .nii.gz)
    nfile="${fname}-cca.nii.gz"
    mv $file "$d1/$nfile"

    filename2=$(basename "$d1/$nfile" .nii.gz)
    outputfile="${filename2}_mesh.vtk"
    ./mesh_ITK "$d1/$nfile" "$d1/$outputfile"
  
  fi
  done
done

