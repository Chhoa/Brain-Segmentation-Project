#!/bin/bash
#SBATCH -J cca_mesh
#SBATCH -N 1 -n 1
#SBATCH --mem=256GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 07:00:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang


dir="/project/mang/data/ADNI_batches/batch_6"

for d1 in "$dir"/*; do
  for d2 in "$d1"/*Seg_MALPEM; do
    for d3 in "$d2"/*; do
      for file in "$d3"/*_MALPEM.nii.gz; do
        ln -s "$file" "$d1/"
      done
    done
  done
done


module load matlab

for d1 in "$dir"/*; do
      for file in "$d1"/*_MALPEM.nii.gz; do
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '$d1'); exit"
    done
done


module load cmake
cd /project/mang/chhoa/mesh1_ITK/build

for d1 in "$dir"/*; do
    for file in "$d1"/[RL]V_*; do
    filename1=$(basename "$file" .nii.gz)
    nfile="${filename1}-cca.nii.gz"
    mv $file "$d1/$nfile"
    filename2=$(basename "$d1/$nfile" .nii.gz)
    outputfile="${filename2}_mesh.vtk"
    ./mesh_ITK "$d1/$nfile" "$d1/$outputfile"
  done
done
