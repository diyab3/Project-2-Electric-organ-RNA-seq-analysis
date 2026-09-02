#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=gzip
#SBATCH --output=LOG/gzipDU_%j.out
#SBATCH --error=LOG/gzipDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=350G

file="CcoxCrh_comrhy62_EO_6cm_1_1_trimmed.fastq"

/usr/bin/time -v gzip $file