#!/bin/bash

mkdir -p ../BAM

for sam in *.sam; do

  base=${sam%.*}

  samtools view -@ 10 -Sb "$sam" | samtools sort -@ 10 -o "../BAM/${base}.bam" && samtools index "../BAM/${base}.bam"

done

