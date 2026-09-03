#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=genomedb
#SBATCH --output=LOG/genomedbDU_%j.out
#SBATCH --error=LOG/genomedbDU_%j.err
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=8


sam_file=CcoxCrh_comrhy62_EO_6cm_1_aligned_readsAligned.out.sam

#sam_file_2=CcoxCrh_comrhy111_EO_adult_2_aligned_readsAligned.out.sam

features_file=campylomormyrus.gtf

/usr/bin/time -v pixi run htseq-count --stranded=yes $sam_file $features_file 

/usr/bin/time -v pixi run htseq-count --stranded=reverse $sam_file $features_file 