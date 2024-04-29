#!/bin/bash

dir="/project/mang/data/ADNI_ants/002_S_0295"

./antsApplyTransforms \
 -i "${dir}/LV_002_S_0295_2006-11-02_08_16_44.0_MALPEM-cca.nii.gz" \
 -r "${dir}/002_S_0295_2006-04-18_08_20_30.0.nii" \
 -o "${dir}/LV_002_S_0295_2006-11-02_08_16_44.0_MALPEM-cca-affine_BSp.nii.gz" \
 -t ["${dir}/002_S_0295_2006-11-02_08_16_44.0ToInitialTp0GenericAffine.mat",0] \
 -n  BSpline \
 -d 3 \
 -v 1

