#!/bin/bash
#this requires a lot of modules
module load python/3.5.1
module load cutadapt/2.9
module load pigz
module load trim_galore
module load fastqc
#set the loop
for fqfile in *1.fq.gz; do
  #define the filename
	filename=$(echo $fqfile | sed 's/1.fq.gz//g')
  #set the job parameters
	sbatch -J ${fqfile}_trim -p general -n 16 -t 2-00:00:00 --mem=36g \
	--wrap="trim_galore -q 20 -j 16 --nextera --paired --fastqc_args \"--outdir ../trimmed_fq/fastqc\" -o ../trimmed_fq ${filename}1.fq.gz ${filename}2.fq.gz"
done

#Still not sure about these job parameters and function options
