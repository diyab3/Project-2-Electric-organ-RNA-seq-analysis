#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=count
#SBATCH --output=LOG/countDU_%j.out
#SBATCH --error=LOG/countDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=8

in_sam=CcoxCrh_comrhy111_EO_adult_2_aligned_readsAligned.out.sam
outfile=CcoxCrh_comrhy111_EO_adult_2_mapped_unmapped_counts.txt

/usr/bin/time -v python mapped_unmapped_reads_count.py -i $in_sam > $outfile