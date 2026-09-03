#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=62final
#SBATCH --output=LOG/62finalDU_%j.out
#SBATCH --error=LOG/62finalDU_%j.err
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=8


sam_file=CcoxCrh_comrhy62_EO_6cm_1_aligned_readsAligned.out.sam

#sam_file=CcoxCrh_comrhy111_EO_adult_2_aligned_readsAligned.out.sam

features_file=/projects/bgmp/shared/Bi623/Project2/campylomormyrus.gff

id_attr=Parent

/usr/bin/time -v pixi run htseq-count --stranded=yes --idattr $id_attr $sam_file $features_file > CcoxCrh_comrhy62_EO_6cm_1_fwd.tsv

/usr/bin/time -v pixi run htseq-count --stranded=reverse --idattr $id_attr $sam_file $features_file > CcoxCrh_comrhy62_EO_6cm_1_rev.tsv