#!/bin/bash

#!/bin/bash
#SBATCH -J mesh
#SBATCH -N 1 -n 1
#SBATCH --mem=128GB
#SBATCH --output=/project/mang/chhoa/scripts/log/run-.%x.%j.out
#SBATCH --error=/project/mang/chhoa/scripts/log/run-.%x.%j.err
#SBATCH -t 00:05:00
#SBATCH --mail-user=jchhoa@uh.edu
#SBATCH --mail-type=end
#SBATCH --mail-type=fail
#SBATCH -A mang

module load cmake

cd /project/mang/chhoa/mesh1_ITK/build
dir="/project/mang/data/ADNI_test"

for d1 in "$dir"/*; do
    for file in "$d1"/[RL]V_*; do
  ###for file in "$d1"/{cca*,binary*}; do
    filename1=$(basename "$file" .nii.gz)
    nfile="${filename1}-cca.nii.gz"
    mv $file "$d1/$nfile"
    filename2=$(basename "$d1/$nfile" .nii.gz)
    outputfile="${filename2}_mesh.vtk"
    ./mesh_ITK "$d1/$nfile" "$d1/$outputfile"
  done
done

