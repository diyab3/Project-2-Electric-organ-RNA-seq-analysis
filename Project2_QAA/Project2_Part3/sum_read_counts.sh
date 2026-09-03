#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=cf62rev
#SBATCH --output=LOG/cf62revDU_%j.out
#SBATCH --error=LOG/cf62revDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=16

file=CcoxCrh_comrhy62_EO_6cm_1_rev.tsv

/usr/bin/time -v grep -v "^_" $file | awk '{sum += $2} END {print sum}'