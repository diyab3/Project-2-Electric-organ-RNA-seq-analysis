#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=convert
#SBATCH --output=LOG/convertDU_%j.out
#SBATCH --error=LOG/convertDU_%j.err
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=8

gff="/projects/bgmp/shared/Bi623/Project2/campylomormyrus.gff"
gtf_output="campylomormyrus.gtf"

/usr/bin/time -v pixi run agat_convert_sp_gff2gtf.pl --gff $gff -o $gtf_output 