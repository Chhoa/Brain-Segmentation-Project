#!/bin/bash
#SBATCH -J CCA
#SBATCH -N 1 -n 1
#SBATCH --output=/project/mang/chhoa/scripts/log/run-%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-%j.err
#SBATCH -t 00:10:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

module load matlab

SDIR=/project/mang/chhoa/results/adni-results-test
DDIR=/project/mang/chhoa/results/test
FILE=/home/amang/work/chhoa/mesh1_ITK/build/cca_RV_tp01-orig_MALPEM.nii.gz

echo matlab -nodisplay -batch "addpath('/project/mang/chhoa/scripts'); segmentExtractRLV_CCA('$FILE', '${DDIR}/'); exit"
matlab -nodisplay -batch "addpath('/project/mang/chhoa/scripts'); segmentExtractRLV_CCA('$FILE', '${DDIR}/'); exit"
