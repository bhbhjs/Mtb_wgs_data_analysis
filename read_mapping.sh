#!/bin/bash

mkdir -p ../SAM

for fq in *_1.fastp.fastq.gz; do
  base=${fq%_1*}
  bwa mem \
    -t 10 -c 100 -M -T 50 \
    -R "@RG\\tID:${base}\\tSM:${base}\\tPL:Illumina" \
    ../reference/reference.fasta \
    "${base}_1.fastp.fastq.gz" \
    "${base}_2.fastp.fastq.gz" \
    > "../SAM/${base}.sam"
done

