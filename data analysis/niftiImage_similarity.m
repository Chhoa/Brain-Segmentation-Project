niftiFile0 = '/Users/chhoa/Research/data/ADNI_data analysis/141_S_1004/141_S_1004_registered0to1.nii';
niftiFile1 = '/Users/chhoa/Research/data/ADNI_data analysis/141_S_1004/141_S_1004_2007-11-16_14_12_33.0.nii';

nifti_normalized0 = nifti_normalize(niftiFile0);
nifti_normalized1 = nifti_normalize(niftiFile1);
similarity_measure = 1 - abs(nifti_normalized1 - nifti_normalized0);
save('/Users/chhoa/Research/data/ADNI_data analysis/141_S_1004/141_S_1004_reg_similarity.mat', 'similarity_measure');
% imwrite(similarity_measure, '/Users/chhoa/Research/data/ADNI_dataOnly/941_S_1311/941_S_1311_orig_similarity.png');

figure
imshow3Dfull(similarity_measure)