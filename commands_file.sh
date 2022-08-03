#bin/bash


#Assembly and gene prediction:

### Commands used for Trinity: ###

`______________________________________________________________________________`



nohup Trinity --seqType fq --single SG_trimmed.fastq --CPU 6 --max_memory 20G &
`______________________________________________________________________________`
`______________________________________________________________________________`




TransDecoder.LongOrfs -t trinity_out_dir/Trinity.fasta
`______________________________________________________________________________`
`______________________________________________________________________________`




TransDecoder.Predict -t trinity_out_dir/Trinity.fasta

`______________________________________________________________________________`





#Mapping:

for i in XM_*.fa; do bowtie2-build $i $i; done
for i in XM_*.fa; do bowtie2 --fast -p 16 -x $i -1 *_R1.fastq.gz -2 *_R2.fastq.gz -U Single_R.fastq.gz -S $i.sam
for i in XM_*.sam ; do samtools view -bS $i | samtools sort -o $i.sorted.bam ; done
for i in XM_*.sorted.bam; do samtools index $i $i.bai; done

