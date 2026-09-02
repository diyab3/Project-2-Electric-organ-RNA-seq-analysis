#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=getdist
#SBATCH --output=LOG/getdistDU_%j.out
#SBATCH --error=LOG/getdistDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=350G

infile="CcoxCrh_comrhy111_EO_adult_2_1_trimmed.fastq.gz"
outfile="CcoxCrh_comrhy62_EO_6cm_1_2_trimmed_read_length_dist.txt"

/usr/bin/time -v zcat $infile | grep --no-group-separator -B 1 "+" | grep -v "+" | awk '{print(length($0))}' | sort| uniq -c |sort > $outfile