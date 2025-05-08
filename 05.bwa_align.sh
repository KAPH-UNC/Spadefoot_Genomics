#!/bin/bash
#load the module
module load bwa

#set the loop
for fqfile in *1.fq.gz; do
  #Set the filename
	filename=$(echo $fqfile | sed 's/_1_val_1.fq.gz//g')
  #Set the job parameters
	sbatch -J ${fqfile}_align -p general -n 24 -t 5-00:00:00 --mem=50g \
  #Write the function
	--wrap="bwa mem -t 24 ../genome/Smultiplicata_psuedogenome.fasta ${filename}_1_val_1.fq.gz ${filename}_2_val_2.fq.gz > ../samfiles/${filename}.sam"
done

#Still need to check all of this
