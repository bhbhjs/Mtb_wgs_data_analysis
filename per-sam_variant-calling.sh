#!/bin/bash

mkdir -p ../per-sample_gvcf

for bam in *.bam; do
	gatk HaplotypeCaller \
	-R ../reference/reference.fasta \
	-I $bam \
	-O ../per-sample_gvcf/"$bam".g.vcf.gz \
	--sample-ploidy 1 \
	--emit-ref-confidence GVCF \
	--min-base-quality-score 20
done
