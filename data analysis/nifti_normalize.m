function image_normalized = nifti_normalize(niftiFile)
% this function loads a nifti image and normalizes its intensities to [0,1]
% input should be the filename with the whole path

% niftiFile = '/Users/chhoa/Research/data/ADNI_dataOnly/141_S_1004/141_S_1004_2006-12-02_10_34_44.0.nii'; 
nii= load_untouch_nii(niftiFile); 
min_norm = 0;
max_norm = 1;
image_normalized = imnormalize( nii.img, min_norm, max_norm);

end

function image_normalized = imnormalize( image_orig, min_norm, max_norm)
    val_max = max(image_orig(:)); 
    val_min = min(image_orig(:)); 
    range = val_max - val_min; 
    image_normalized = (image_orig - val_min) ./ range;
    range2 = max_norm - min_norm;
    image_normalized = (image_normalized*range2) + min_norm;
end