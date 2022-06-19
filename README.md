# B.tabci_salivary_glands


In this work you can find the codes and explanations for 
in the whiteflies of the *Bemisia tabaci* (Gennadius) (Hemiptera: Aleyrodidae) MEAM1.

The SRA*** files where obtained from:




The reads where mapped and manually analyzed using the following commands:

`______________________________________________________________________________`



for i in Cap_*.fa; do bowtie2-build $i $i; done
`______________________________________________________________________________`



`______________________________________________________________________________`

for i in Cap_*.fa; do bowtie2 --fast -p 16 -x $i  -1 *_R1.fastq.gz -2 *_R2.fastq.gz -U Single_R.fastq.gz -S $i.sam | samtools sort -@ 12 -T temp -o $i.sorted.bam; done
`______________________________________________________________________________`



`______________________________________________________________________________`

samtools index file.sorted.bam  file.sorted.bam.bai
`______________________________________________________________________________`
