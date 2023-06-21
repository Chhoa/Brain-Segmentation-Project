#!/bin/bash
#SBATCH -J CCA
#SBATCH -N 1 -n 1
#SBATCH --mem=3GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 04:00:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

module load matlab
dir="/project/mang/data/ADNI_data+results"

for d1 in "$dir"/1*; do
      for file in "$d1"/1*_MALPEM.nii.gz; do
      fname=$(basename "$file" .nii.gz)
      vname=LV_$fname-cca.nii.gz
     
      if [ ! -f $d1/$vname ]; then
      #echo $file
      matlab -nodisplay -batch "addpath('/project/mang/chhoa/MLtoolbox/NIfTI_20140122'); segmentExtractRLV_CCA_mod('$file', '$d1'); exit"

fi    
done
done
