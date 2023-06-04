#!/bin/bash

sdir="/project/mang/data/adni_0"
tdir="/project/mang/data/adni_0_batches"
batch_size=10
counter=0
batch_number=1

mkdir -p "${tdir}/batch_${batch_number}"

for subfolder in "${sdir}"/*/; do
 cp -r "$subfolder" "${tdir}/batch_${batch_number}"
 counter=$((counter + 1))
 if [ $counter -eq $batch_size ]; then
    counter=0
    batch_number=$((batch_number + 1))
    mkdir -p "${tdir}/batch_${batch_number}"
 fi
done

