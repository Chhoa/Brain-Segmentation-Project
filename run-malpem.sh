#!/bin/bash
### sbatch parameters
#SBATCH -J malpem 
#SBATCH -N 1 -n 40
#SBATCH --mem=128GB
#SBATCH --output=run-%x.%j.out
#SBATCH --error=run-%x.%j.err
#SBATCH -t 10:00:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

### directory of your code
CDIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/adni_0/002_S_1070

#### define paths
RDIR=/project/mang/chhoa/results/adni-results/002_S_1070

#### submitt job
${CDIR}/bin/malpem-proot -i ${DDIR}/tp05-orig.nii.gz -o ${RDIR} --threads 40



