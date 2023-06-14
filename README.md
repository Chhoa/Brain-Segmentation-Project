# Brain-Segmentation-Project

This repo is linked to /project/mang/chhoa/scripts on UH Sabine cluster.

### Purpose: Segmenting brain structures and cleaning them (data preprocessing)

Steps and short descriptions to using the scripts are as follows:


## Step 1

~~Creating batches --> [batch_mod.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/batch_mod.sh)~~

~~- copies directories from _sdir_ in batches and creates batch directories inside _tdir_ to put them in~~

~~- also leaves the old copied directories in _tdir_ untouched when ran again~~

**Setup:** Two directories, one with the data and another including both data and results.

Syncing new data from the former(data) directory to the latter(data+results): 

`rsync -vr /project/mang/data/ADNI/. /project/mang/data/ADNI_data+results/.`


## Step 2 

Creating soft links to original nifty files --> [symlink_orig.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/symlink_orig.sh)

- creates soft link to the original nifty file that are in four step depth of the main directory _dir_

- the links are created in the first depth of each corresponding subdirectory

- also each file is named after their corresponding subdirectory and the date extracted from the corresponding subfolder name at the third step depth

- doesn't create link for file that would overwrite the existing one (i.e, same name because of same subdirectory and same date)

${\color{lightblue}Warning:}$ ***Moving the directories around after symlinking would mess up the links.***

## Step 3

Running [MALPEM](https://github.com/ledigchr/MALPEM) software for segmentations --> [run-malpem-all-mod.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/run-malpem-all-mod.sh)

- runs malpem code existing in directory _CDIR_

- iterates over each subdirectory of _DDIR_

- creates folder names _Seg_MALPEM_ in each subdirectory

- runs the code for each nifty file and spits outputs to _Seg_MALPEM_ in each corresponding subdirectory

## Step 4

Creating soft links to MALPEM segmentations --> [symlink_seg.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/symlink_seg.sh)

- creates soft link to the nifty files that has names ending with _MALPEM.nii.gz_ (malpem segmentations) that are in the subdirectories of the _Seg_MALPEM_ folder of the corresponding subdirectories of the main directory _dir_

- the links are created in the first depth of each corresponding subdirectory

- file names are unchanged

${\color{lightblue}Warning:}$ ***Moving the directories around after symlinking would mess up the links.***

## Step 5

Extracting segmentation structures (Left & Right Ventricles) & cleaning them --> [segmentExtractRLV_CCA_mod.m](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/segmentExtractRLV_CCA_mod.m), [segExtractRLV_ML-mod_sbatch.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/segExtractRLV_ML-mod_sbatch.sh) 

- extracts segmentations of right and left ventricles for file names ending with _MALPEM.nii.gz_ in the subdirectories of _dir_ using matlab
- the segmentations are also cleaned by connected component anlysis using matlab's [bwconncomp](https://www.mathworks.com/help/images/ref/bwconncomp.html) function with connectivity 6 and files are saved with names starting with _RV_, _LV _ at the beginning 
- the batchjob has to be submitted by the command `sbatch segExtractRLV_ML-mod_sbatch.sh`, files are saved in their corresponding input directories

## Step 6

Renaming the cleaned segmentation files and meshing them via ITK --> [mesh_loop-mod_sbatch.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/mesh_loop-mod_sbatch.sh)

- adds _-cca_ at the end of the file names starting with _RV_ and _LV_ in the subdirectories of _dir_ 
- meshes the above files using ITK libraries and saves them as _.vtk_ files with names ending with _mesh_
- the batchjob has to be submitted by the command `sbatch mesh_loop-mod_sbatch.sh`, files are saved in their corresponding input directories

## Step 5+6 

Can skip step 5 and 6 --> [seg_slink-ExtractRLVcca-mesh.sh](https://github.com/Chhoa/Brain-Segmentation-Project/blob/main/seg_slink-ExtractRLVcca-mesh.sh)
- combination of step 5 and 6, the batchjob has to be submitted by the command `sbatch seg_slink-ExtractRLVcca-mesh.sh`
