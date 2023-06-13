#!/bin/bash

folder="/project/mang/data/ADNI_batchesCOPY/016_S_1326/Seg_MALPEM/016_S_1326_2007-03-01_11_09_36.0_06-06-23_02-40-06"

#extracting folder name up to the character '.'
name="${folder%%[.]*}"
bname=$(basename "$name")
echo "$bname"

