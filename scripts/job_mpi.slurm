#!/bin/bash

# Run this script on a cluster by typing
#   sbatch job_mpi.slurm
#
# The script is based on the following sources:
#   https://www.hpc.iastate.edu/guides/sample-job-scripts/abaqus
#   https://slurm.schedmd.com/sbatch.html

#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --mem=5000M
#SBATCH --time=02:30:00
#SBATCH --job-name=your_job

# Load abaqus module
module load abaqus/6.13
module load intel/2013

# ...
abaqus input=your_inp_file job=your_job cpus=$SLURM_NTASKS user=user_subroutine.f verbose=2 standard_parallel=all mp_mode=mpi -interactive > your_job.txt
