#/bin/bash

dir="/project/mang/data/ADNI_ants/002_S_0413"

fixed_image="${dir}/002_S_0413_2006-05-02_12_31_52.0.nii"

code_dir="/project/mang/chhoa/code/ants/install/bin"

moving_image="${dir}/002_S_0413_2009-05-04_14_34_42.0.nii"

moving_filename=$(basename "$moving_image" .nii)

    ${code_dir}/./antsRegistration \
        --verbose 1 \
        --dimensionality 3 \
        --float 0 \
        --collapse-output-transforms 1 \
        --output ["${dir}/${moving_filename}ToInitialTp","${dir}/${moving_filename}ToInitialTpWarped.nii","${dir}/${moving_filename}ToInitialTpInverseWarped.nii"] \
        --interpolation Linear \
        --use-histogram-matching 0 \
        --winsorize-image-intensities [ 0.005,0.995 ] \
        --initial-moving-transform [ "${moving_image}","${fixed_image}",1 ] \
        --transform Rigid[ 0.1 ] \
        --metric MI[ "${moving_image}","${fixed_image}",1,32,Regular,0.25 ] \
        --convergence [ 1000x500x250x100,1e-6,10 ] \
        --shrink-factors 12x8x4x2 \
        --smoothing-sigmas 4x3x2x1vox \
        --transform Affine[ 0.1 ] \
        --metric MI[ "${moving_image}","${fixed_image}",1,32,Regular,0.25 ] \
        --convergence [ 1000x500x250x100,1e-6,10 ] \
        --shrink-factors 12x8x4x2 \
        --smoothing-sigmas 4x3x2x1vox
