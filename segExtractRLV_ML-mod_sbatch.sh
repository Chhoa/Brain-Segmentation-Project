#!/bin/bash
#SBATCH -J CCA
#SBATCH -N 1 -n 1
#SBATCH --mem=128GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 00:15:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

module load matlab
dir="/project/mang/data/ADNI_test"

for d1 in "$dir"/*; do
      for file in "$d1"/*_MALPEM.nii.gz; do
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '$d1'); exit"
    done
done
