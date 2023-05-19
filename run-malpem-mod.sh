#!/bin/bash
### sbatch parameters
#SBATCH -J malpem 
#SBATCH -N 1 -n 40
#SBATCH --mem=128GB
#SBATCH --output=run-%x.%j.out
#SBATCH --error=run-%x.%j.err
#SBATCH -t 10:00:00
#SBATCH --mail-user=andreas@math.uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

### directory of your code
CDIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/adni_0/002_S_0413

#### define paths
RDIR=/project/mang/chhoa/results/adni-results/002_S_0413

#### submitt job
# ${CDIR}/bin/malpem-proot -i ${DDIR}/tp01.nii.gz -o ${RDIR} --threads 40 --noN4 --noN4_after_pincram -f 1.5T
${CDIR}/bin/malpem-proot -i ${DDIR}/tp01.nii.gz -o ${RDIR} --threads 40

