#!/bin/bash

mkdir data && cd data

### VCF truthset and index ###
echo "downloading VCF truthset from ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/..."
mkdir truthset && cd truthset

# README
wget https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/README_NISTv3.3.2.txt

# VCF
wget https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/GRCh38/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz
wget https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/GRCh38/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz.tbi

echo "done"

### Illumina 30x and 300x BAM files and indices ###
echo "downloading Illumina bam files from ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/..."
cd ..
mkdir illumina && cd illumina

# README
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/NHGRI_Illumina300X_novoalign_bams/README_NIST_Illumina_pairedend_NA12878.txt

# 30x bam (downsampled)
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/RMNISTHS_30xdownsample.bam
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/RMNISTHS_30xdownsample.bam.bai

# 300x bam and index w/readme
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/NHGRI_Illumina300X_novoalign_bams/HG001.GRCh38_full_plus_hs38d1_analysis_set_minus_alts.300x.bam
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/NHGRI_Illumina300X_novoalign_bams/HG001.GRCh38_full_plus_hs38d1_analysis_set_minus_alts.300x.bam.bai
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/NHGRI_Illumina300X_novoalign_bams/README

echo "done"

### Ultralong Oxford Nanopore BAM file and index ###
echo "downloading Oxford Nanopore bam files from ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/Ultralong_OxfordNanopore/..."

cd ..
mkdir OxfordNanopore && cd OxfordNanopore

# README
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/Ultralong_OxfordNanopore/Ultralong_OxfordNanopore/NA12878-minion-ul-README.txt

# bam file and index
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/Ultralong_OxfordNanopore/Ultralong_OxfordNanopore/NA12878-minion-ul_GRCh38.bam
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/Ultralong_OxfordNanopore/Ultralong_OxfordNanopore/NA12878-minion-ul_GRCh38.bam.bai

echo "done"

### Pacbio Hifi error-corrected BAM file and index ###
echo "downloading Pacbio hifi bam files from ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NA12878_PacBio_MtSinai/..."

cd ..
mkdir Pacbio && cd Pacbio

# README
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NA12878_PacBio_MtSinai/README.txt

# bam file and index
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NA12878_PacBio_MtSinai/sorted_final_merged.bam
wget https://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NA12878_PacBio_MtSinai/sorted_final_merged.bam.bai

echo "done"
