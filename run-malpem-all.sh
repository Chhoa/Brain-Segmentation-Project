#!/bin/bash
### directory of code
CDIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/adni_rest

### results directory
RDIR=/project/mang/chhoa/results/adni-rest

### loop over each subfolder
for subfolder in ${DDIR}/*
do
  subfolder_name=$(basename "$subfolder")
  ### create the output directory if it does not exist
  mkdir -p "${RDIR}/${subfolder_name}"
  ### loop over each file in the subfolder
  for file in ${subfolder}/*.nii.gz
  do
    ### submit the job
    sbatch <<EOF
#!/bin/bash
#SBATCH -J malpem
#SBATCH -N 1 -n 40
#SBATCH --mem=128GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 10:00:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

### run the malpem-proot command
${CDIR}/bin/malpem-proot -i ${file} -o ${RDIR}/${subfolder_name} --threads 40
EOF
  done
done
