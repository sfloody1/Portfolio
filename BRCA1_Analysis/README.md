# BRCA1 Analysis

This project analyzes BRCA1 variant patterns across populations using raw sequencing data from public genomic datasets.

## Objective
To detect heterozygous variants in BRCA1 and summarize variant counts across samples and regions.

## Skills Demonstrated
- Bash scripting and workflow automation
- Command-line bioinformatics
- FASTQ file download and preprocessing
- Read alignment with Bowtie2
- SAM/BAM handling with samtools
- Variant calling with freebayes
- VCF filtering and normalization with bcftools
- Reproducible data analysis pipelines
- Genomic variant interpretation

## Workflow
1. Download FASTQ files from public genome databases using wget
2. Decompress and organize files by region/country
3. Build Bowtie2 index for BRCA1 reference
4. Align reads to BRCA1 reference
5. Sort BAM files and compute alignment stats
6. Call variants with freebayes
7. Normalize/filter VCFs
8. Identify heterozygous genotypes
9. Export per-sample heterozygous counts

## Tools Used
- Bash
- wget
- Bowtie2
- samtools
- freebayes
- bcftools

## Outputs
- Sample-level heterozygous variant tables
- Summary counts by sample and region
- Filtered VCF files and QC metrics

## Repository Files
- `total_pipeline.sh` – full analysis pipeline
- `get_files.sh` – data acquisition helper
- `BRCA1_analysis.pdf` – report or analysis summary
