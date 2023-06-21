#!/bin/bash

module load cmake

cd /project/mang/chhoa/mesh1_ITK/build
dir="/project/mang/data/ADNI_data+results"

for d1 in "$dir"/10*; do
    for file in "$d1"/[RL]V_*_MALPEM-cca.nii.gz; do
    #for file in "$d1"/{cca*,binary*}; do

    fname=$(basename "$file" .nii.gz)
    vname="$fname"_mesh.vtk

    if [ ! -f $d1/$vname ]; then

    echo $file
    #filename1=$(basename "$file" .nii.gz)
    #nfile="${filename1}-cca.nii.gz"
    #mv $file "$d1/$nfile"

    #filename2=$(basename "$d1/$nfile" .nii.gz)
    #outputfile="${filename2}_mesh.vtk"
    #./mesh_ITK "$d1/$nfile" "$d1/$outputfile"
    ./mesh_ITK "$file" "$d1/$vname"
  fi
  done
done

