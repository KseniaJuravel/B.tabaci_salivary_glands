# B.tabci_salivary_glands


In this work you can find the codes and explanations for 
in the whiteflies of the *Bemisia tabaci* (Gennadius) (Hemiptera: Aleyrodidae) MEAM1.

The SRA*** files where obtained from:
1. RNAseq of salivary glands
   Identifiers:	BioSample: SAMEA4682676; SRA: ERS2502869
   Organism:	Bemisia tabaci 
   Accession: SAMEA4682676	ID: 12215746
2. Identification of Saliva Proteins of the Whitefly Bemisia tabaci by Transcriptome
   Identifiers:	BioSample: SAMN13381603 ; SRA: SRS5714533
   Organism:	Bemisia tabaci
   Accession: SAMN13381603




The reads where mapped and manually analyzed using the following commands:

`______________________________________________________________________________`



for i in XM_*.fa; do bowtie2-build $i $i; done

`______________________________________________________________________________`



`______________________________________________________________________________`

for i in XM_*.fa; do bowtie2 --fast -p 16 -x $i  -1 *_R1.fastq.gz -2 *_R2.fastq.gz -U Single_R.fastq.gz -S $i.sam 

`______________________________________________________________________________`


`______________________________________________________________________________`

for i in XM_*.sam ; do samtools view -bS $i | samtools sort -o $i.sorted.bam ; done

`______________________________________________________________________________`

`______________________________________________________________________________`

samtools index file.sorted.bam  file.sorted.bam.bai

`______________________________________________________________________________`
