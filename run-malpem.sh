#!/bin/bash
### sbatch parameters
#SBATCH -J malpem 
#SBATCH -N 1 -n 40
#SBATCH --mem=128GB
#SBATCH --output=run-%x.%j.out
#SBATCH --error=run-%x.%j.err
#SBATCH -t 01:00:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

### directory of your code
CDIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/ADNI_batches/batch_6/123_S_0050

#### define paths
RDIR=/project/mang/data/ADNI_batches/batch_6/123_S_0050/Seg_MALPEM

#### submitt job
${CDIR}/bin/malpem-proot -i ${DDIR}/123_S_0050_2005-11-11_13_51_11.0.nii -o ${RDIR} --threads 40



