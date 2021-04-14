# Execution

To execute a job, you can use the [command line](https://abaqus-docs.mit.edu/2017/English/SIMACAEEXCRefMap/simaexc-c-analysisproc.htm) or the *Job* module of Abaqus/CAE.



## Executing Abaqus jobs on a cluster

Abaqus provides both [thread-based parallelism and message passing](https://abaqus-docs.mit.edu/2017/English/SIMACAEEXCRefMap/simaexc-c-parallelmodes.htm). We show the process for the [SLURM](https://slurm.schedmd.com/) job scheduling system. 



### Submitting a job

Use the [`sbatch`](https://slurm.schedmd.com/sbatch.html) command to submit a batch script. The arguments can either be given as command line arguments to `sbatch` or as directives in the script you submit. There are many options, so check out the documentation if necessary. For convenience, you can find the example script [**job_mpi.slurm**](scripts/job_mpi.slurm) in the *scripts/* directory. The script has the following features:
- defines the number of nodes, and within a node the number of CPUs
- parallelization in Abaqus is chosen to be based on MPI
- supports a user subroutine in Abaqus
- works with Abaqus 6.13



