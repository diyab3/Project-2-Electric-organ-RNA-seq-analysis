#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=align
#SBATCH --output=LOG/alignDU_%j.out
#SBATCH --error=LOG/alignDU_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=8

R1=../Project2_Part2/CcoxCrh_comrhy111_EO_adult_2_1_trimmed.fastq.gz
R2=../Project2_Part2/CcoxCrh_comrhy111_EO_adult_2_2_trimmed.fastq.gz
genome_dir=campylomormyrus_genome
outfile_name_prefix=CcoxCrh_comrhy111_EO_adult_2_aligned_reads

/usr/bin/time -v pixi run STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $R1 $R2 \
--genomeDir $genome_dir \
--outFileNamePrefix $outfile_name_prefix