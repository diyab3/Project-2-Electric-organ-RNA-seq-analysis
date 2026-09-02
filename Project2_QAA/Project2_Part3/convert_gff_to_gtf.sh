#!/usr/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=convert
#SBATCH --output=LOG/convertDU_%j.out
#SBATCH --error=LOG/convertDU_%j.err
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=8