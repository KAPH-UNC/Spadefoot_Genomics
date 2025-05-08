#This is the script to make a tarball file from raw sequence data so that it can be handled in a compressed format.
#This is executed on a cluster, in this case using the slurm format

#First, define the job parameters
sbatch -J tarball -p general -n 1 -t 1:00:00 --mem=16g
tar czf ${1}.tar.gz ${2}
#When executed in command line with two arguments (file and destination folder), this should execute. Probably will change this to work on many files in parallel.
