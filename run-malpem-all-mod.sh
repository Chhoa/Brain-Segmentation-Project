#!/bin/bash
### directory of code
CDIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/ADNI_batches/batch_1

### loop over each subfolder
for subfolder in ${DDIR}/*
do
  ### create the output directory if it does not exist
  mkdir -p "${subfolder}/Seg_MALPEM"
  ### loop over each file in the subfolder
  for file in ${subfolder}/*.nii
  do
    ### submit the job
    sbatch <<EOF
#!/bin/bash
#SBATCH -J malpem
#SBATCH -N 1 -n 40
#SBATCH --mem=128GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 01:00:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

### run the malpem-proot command
${CDIR}/bin/malpem-proot -i ${file} -o ${subfolder}/Seg_MALPEM --threads 40
EOF
  done
done
