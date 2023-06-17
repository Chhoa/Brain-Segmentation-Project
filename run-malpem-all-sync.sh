#!/bin/bash

CDIR=/project/mang/chhoa/code/malpem
DDIR=/project/mang/data/ADNI_data+results

for subfolder in ${DDIR}/94*; do
mkdir -p "${subfolder}/Seg_MALPEM"

 for file in ${subfolder}/*.nii; do
 fname=$(basename "$file" .0.nii)
  match=0

  for folder in "${subfolder}/Seg_MALPEM"/*; do
  fdname=$(basename "${folder%%[.]*}")
    if [ "$fname" = "$fdname" ];
    then match=1
    fi
  done

  if [ $match = 0 ];then

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
#SBATCH --mail-type=fail
#SBATCH -A mang

### run the malpem-proot command
${CDIR}/bin/malpem-proot -i ${file} -o ${subfolder}/Seg_MALPEM --threads 40
#echo "$file"
EOF

  fi
done
done
