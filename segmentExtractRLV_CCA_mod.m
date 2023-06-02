function segmentExtractRLV_CCA_mod(filename, output_dir)

nii = load_untouch_nii(filename);
[~,name,ext] = fileparts(filename);

% create binary image for label 23
nii_RV = nii;
for i = 1:numel(nii_RV.img)
    if nii_RV.img(i) == 23
        nii_RV.img(i) = 1;
    else
        nii_RV.img(i) = 0;
    end
end

binary_filename_RV = fullfile(output_dir, ['binary_RV_' name ext]);
save_untouch_nii(nii_RV, binary_filename_RV);

% create binary image for label 24
nii_LV = nii;
for i = 1:numel(nii_LV.img)
    if nii_LV.img(i) == 24
        nii_LV.img(i) = 1;
    else
        nii_LV.img(i) = 0;
    end
end

binary_filename_LV = fullfile(output_dir, ['binary_LV_' name ext]);
save_untouch_nii(nii_LV, binary_filename_LV);

% connected component analysis

% right ventricle
CC = bwconncomp(nii_RV.img, 18);
num_pixels = cellfun(@numel, CC.PixelIdxList);
[~,idx] = max(num_pixels);
for i = 1:CC.NumObjects
    if i ~= idx
        nii_RV.img(CC.PixelIdxList{i}) = 0;
    end
end
largest_component_filename_RV = fullfile(output_dir, ['cca_RV_' name ext]);
save_untouch_nii(nii_RV, largest_component_filename_RV);


% left ventricle
CC = bwconncomp(nii_LV.img, 18);
num_pixels = cellfun(@numel, CC.PixelIdxList);
[~,idx] = max(num_pixels);
for i = 1:CC.NumObjects
    if i ~= idx
        nii_LV.img(CC.PixelIdxList{i}) = 0;
    end
end
largest_component_filename_LV = fullfile(output_dir, ['cca_LV_' name ext]);
save_untouch_nii(nii_LV, largest_component_filename_LV);

end
