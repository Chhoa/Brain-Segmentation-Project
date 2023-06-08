#!/bin/bash
#SBATCH -J CCA
#SBATCH -N 1 -n 1
#SBATCH --mem=128GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 00:05:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

module load matlab

SDIR=/project/mang/chhoa/results/adni-results-018_S_0335
DDIR=/project/mang/chhoa/results/adni-cca-018_S_0335

for folder in "$SDIR"/*
do
  folder_name=$(basename "$folder")
  mkdir -p "${DDIR}/${folder_name}"
  for folder2 in "$folder"/*
  do
    folder2_name=$(basename "$folder2")
    mkdir -p "${DDIR}/${folder_name}/${folder2_name}"
    for file in "$folder2"/*-orig_MALPEM.nii.gz
    do
      #filename=$(basename "$file" .nii.gz)
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '${DDIR}/${folder_name}/${folder2_name}'); exit"
    done
  done
done

