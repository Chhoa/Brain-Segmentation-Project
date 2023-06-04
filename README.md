# Brain-Segmentation-Scripts

These scripts are linked to /project/mang/chhoa/scripts on UH Sabine cluster.

Purpose: Segmenting brain structures and cleaning them (data preprocessing)

Steps and short descriptions to using the scripts are as follows:


**Step 1 ^.^**

Creating batches --> batch_mod.sh

-copies directories from 'sdir' in batches and creates batch directories inside 'tdir' to put them in

-also leaves the old copied directories in 'tdir' untouched when ran again

**-------------------------------------------------------------------------------------------------------**

sdir/

|--dir1/

|--dir2/

.

.

.

.


**-------------------------------------------------------------------------------------------------------**


**-------------------------------------------------------------------------------------------------------**

ddir/

|--batch_1/
  
|  |--dir1/
  
|  |--dir2/
  
|   .
   
|   .
   
|   .
  
  
| .
 
| .
 
| .
 
 |--batch_100/
 
 |  .
   
 |  .
   
 |  . 
   
**-------------------------------------------------------------------------------------------------------** 
   
  

**Step 2 ^.^**

Creating soft links to original nifty files --> symlink_orig.sh

-creates soft link to the original nifty file that are in four step depth of the main directory 'dir'

-the links are created in the first depth of each corresponding subdirectory

-also each file is named after their corresponding subdirectory and the date extracted from the corresponding subfolder name at the third step depth

-doesn't create link for file that would overwrite the existing one (i.e, same name because of same subdirectory and same date)

**Step 3 ^.^**

Running [MALPEM](https://github.com/ledigchr/MALPEM) software for segmentations --> run-malpem-all-mod.sh

-runs malpem code existing in directory 'CDIR'

-iterates over each subdirectory of 'DDIR'

-creates folder names 'Seg_MALPEM' in each subdirectory

-runs the code for each nifty file and spits outputs to 'Seg_MALPEM' in each corresponding subdirectory

**Step 4 ^.^**

Creating soft links to MALPEM segmentations --> symlink_seg.sh

-creates soft link to the nifty files that has names ending with '_MALPEM.nii.gz' (malpem segmentations) that are in the subdirectories of the 'Seg_MALPEM' folder of the corresponding subdirectories of the main directory 'dir'

-the links are created in the first depth of each corresponding subdirectory

-file names are unchanged

Step 5 ^.^

Extracting segmentation structures (Left & Right Ventricles) & cleaning them --> .m, .sh 
