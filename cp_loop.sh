#!/bin/bash

### directory of code
SDIR=/project/mang/data/ADNI_data+results
DDIR=/project/mang/data/ADNI_vnew

### loop over each folder
for folder in "$SDIR"/*
do
    folder_name=$(basename "$folder")
    ### create the output directory if it does not exist
    mkdir -p "${DDIR}/${folder_name}"
    #for folder2 in "$folder"/*
    #do
        #folder2_name=$(basename "$folder2")
        #mkdir -p "${DDIR}/${folder_name}/${folder2_name}"
        for file in "$folder"/*vtk
        do
            ### check if the item is a file
            if [ -f "${file}" ]
            then
                cp -v "${file}" "${DDIR}/${folder_name}"
            fi
        done
    #done
done
