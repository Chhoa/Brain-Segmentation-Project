#!/bin/bash
#SBATCH -J CCA
#SBATCH -N 1 -n 1
#SBATCH --output=/project/mang/chhoa/scripts/log/run-%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-%j.err
#SBATCH -t 00:05:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

module load matlab

DDIR=/project/mang/chhoa/results
FILE=/project/mang/chhoa/results/067_S_0076_2005-12-06_11_34_31.0_MALPEM.nii.gz

echo matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA('$FILE', '${DDIR}/'); exit"
matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA('$FILE', '${DDIR}/'); exit"
