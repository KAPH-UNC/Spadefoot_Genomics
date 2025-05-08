#!/bin/bash

#Script to create a fastq file
#Load the module
module load fastqc
#start the loop
for fqfile in *.fq.gz; do
  #set the job parameters
  sbatch -J ${fqfile}_fastqc -p general -n 8 --mem=20g -t 1-00:00:00 \
    --wrap="fastqc --noextract --outdir fastqc -t 8 $fqfile"
done

#I still need to check these parameters to see if these are optimal. Also want to check the function options.
