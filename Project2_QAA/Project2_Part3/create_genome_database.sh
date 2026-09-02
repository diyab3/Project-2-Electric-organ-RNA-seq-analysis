#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=genomedb
#SBATCH --output=LOG/genomedbDU_%j.out
#SBATCH --error=LOG/genomedbDU_%j.err
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=8

module load star/2.7.11b

/usr/bin/time -v star --runThreadN 8 --runMode genomeGenerate --genomeDir campylomormyrus_genome --genomeFastaFiles /projects/bgmp/shared/Bi623/Project2/campylomormyrus.fasta --sjdbGTFfile --sjdbOverhang 100 