#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=trim
#SBATCH --output=LOG/trimDU_%j.out
#SBATCH --error=LOG/trimDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=200G

input_1="CcoxCrh_comrhy62_EO_6cm_1_1_cutadapt.fastq"

input_2="CcoxCrh_comrhy62_EO_6cm_1_2_cutadapt.fastq"

paired_output_1="CcoxCrh_comrhy62_EO_6cm_1_1_trimmed.fastq.gz"  # where the reads that pass the filtering in R1 and R2 go

unpaired_output_1="CcoxCrh_comrhy62_EO_6cm_1_1_unpaired.fastq.gz"  # where the reads that do not pass the filtering in both R1 and R2 go 

paired_output_2="CcoxCrh_comrhy62_EO_6cm_1_2_trimmed.fastq.gz"

unpaired_output_2="CcoxCrh_comrhy62_EO_6cm_1_2_unpaired.fastq.gz"

/usr/bin/time -v pixi run trimmomatic PE -threads 8 $input_1 $input_2 $paired_output_1 $unpaired_output_1 $paired_output_2 $unpaired_output_2 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35