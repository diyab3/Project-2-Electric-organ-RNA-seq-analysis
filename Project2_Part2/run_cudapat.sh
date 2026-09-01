#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=cutadapt
#SBATCH --output=LOG/cutadaptDU_%j.out
#SBATCH --error=LOG/cutadaptDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=8

ADAPTER_FWD="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
ADAPTER_REV="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"
out_1_fastq="CcoxCrh_comrhy111_EO_adult_2_1_cutadapt.fastq"
out_2_fastq="CcoxCrh_comrhy111_EO_adult_2_2_cutadapt.fastq"
in_1_fastq="../Project2_Part1/CcoxCrh_comrhy111_EO_adult_2_1.fastq"
in_2_fastq="../Project2_Part1/CcoxCrh_comrhy111_EO_adult_2_2.fastq"

/usr/bin/time -v pixi run cutadapt -a $ADAPTER_FWD -A $ADAPTER_REV -o $out_1_fastq -p $out_2_fastq $in_1_fastq $in_2_fastq