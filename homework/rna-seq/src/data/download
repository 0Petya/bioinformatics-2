#!/bin/bash

mkdir -p ../../data/raw/
cd ../../data/raw/

runs="SRR1066657 SRR1066658 SRR1066659 SRR1066660"
for run in $runs; do
    fasterq-dump $run
done

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/146/045/GCF_000146045.2_R64/GCF_000146045.2_R64_genomic.fna.gz
gunzip GCF_000146045.2_R64_genomic.fna.gz

wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/146/045/GCF_000146045.2_R64/GCF_000146045.2_R64_genomic.gff.gz
gunzip GCF_000146045.2_R64_genomic.gff.gz

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/146/045/GCF_000146045.2_R64/GCF_000146045.2_R64_rna.fna.gz
gunzip GCF_000146045.2_R64_rna.fna.gz
