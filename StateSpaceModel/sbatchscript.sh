#!/bin/sh
#SBATCH --job-name=StanRoll
#
# Project:
#SBATCH --account=uio
#
# Wall clock limit:
#SBATCH --time=30:00:00
#
# Tasks:
#SBATCH --ntasks=1
#
# Cores:
#SBATCH --cpus-per-task=4
#
#  Max memory usage per core (MB):
#SBATCH --mem-per-cpu=15000

## Set up job environment:
source /cluster/bin/jobsetup
module purge   # clear any inherited modules
set -o errexit # exit on errors
module load R/3.4.1.gnu #Load R
module load openmpi.gnu/1.10.2

## Copy input files to the work directory:
cp $SUBMITDIR/polls_long.csv $SCRATCH
cp $SUBMITDIR/Stanscript_abel.R $SCRATCH
cp $SUBMITDIR/state_space_polls_hg.stan $SCRATCH


## Make sure the results are copied back to the submit directory (see Work Directory below):
cleanup "cp -R $SCRATCH $HOME/pollofpolls/"


## Do some work:
cd $SCRATCH
Rscript Stanscript_abel.R