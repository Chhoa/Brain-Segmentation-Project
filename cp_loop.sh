#!/bin/bash

### directory of code
SDIR=/project/mang/chhoa/results/adni-results
DDIR=/project/mang/chhoa/results/adni-rest_confined

### loop over each folder
for folder in "$SDIR"/*
do
    folder_name=$(basename "$folder")
    ### create the output directory if it does not exist
    mkdir -p "${DDIR}/${folder_name}"
    ### loop over each file within the current folder
    for folder2 in "$folder"/*
    do
        folder2_name=$(basename "$folder2")
        mkdir -p "${DDIR}/${folder_name}/${folder2_name}"
        for file in "$folder2"/*
        do
            ### check if the item is a file
            if [ -f "${file}" ]
            then
                cp "${file}" "${DDIR}/${folder_name}/${folder2_name}"
            fi
        done
    done
done
