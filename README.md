# B.tabaci's salivary glands genes identification #


This repository includes all the codes, results  and explanations for the identification of the differentially expressed cathepsin B and L genes from figures 5 and 6 in the article "Evolved transcriptional responses and their trade-offs after long-term adaptation of *Bemisia tabaci* to a marginally-suitable host". These genes are likely to be found at the salivary glands of the whitefly *Bemisia tabaci* (Gennadius) (Hemiptera: Aleyrodidae) MEAM1.



The following files were obtained from the NCBI for the analysis:

1. RNAseq of salivary glands

   Identifiers:	BioSample: SAMEA4682676; SRA: ERS2502869
   
   Organism:	Bemisia tabaci 
   
   Accession: SAMEA4682676	ID: 12215746

2. Identification of Saliva Proteins of the Whitefly *Bemisia tabaci* by Transcriptome

   Identifiers:	BioSample: SAMN13381603 ; SRA: SRS5714533
   
   Organism:	*Bemisia tabaci*
   
   Accession: SAMN13381603


All the steps are listed and described below.

### General workflow: ###

1. File of 13 cathepsin B and L genes created.
2. Simmilrity of genes was accessed.
3. The genes blasted against 8,610 salivary gland genes in *B.tabaci* found in the NCBI.
4. Transcriptomic data from salivary glands of *B.tabaci* blasted in the NCBI online against the genes.
5. Transcriptomic data from salivary glands of *B.tabaci* was assembled using Trinity and genes were predicted using Transdecoder.
6. Transcriptomic data from salivary glands of *B.tabaci* was mapped against the genes.
7. The genes were analised for signal peptides (SP) in the webpage [signalP](https://services.healthtech.dtu.dk/service.php?SignalP-5.0).


### Programs used: ###


[UGENE](http://ugene.net/), [IGV](https://software.broadinstitute.org/software/igv/), [bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) and [Transdecoder](https://github.com/TransDecoder/TransDecoder/wiki).

[Commands used for assembly and gene prediction from transcriptomic data](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/commands_file.sh)

### Commands used for mapping: ###

The reads where mapped and manually analyzed using the following [commands](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/commands_file.sh):

1. Indexing of the database ($i == Transcripts of cathepsin B and L genes):


`______________________________________________________________________________`



for i in XM_*.fa; do bowtie2-build $i $i; done

`______________________________________________________________________________`



2. Mapping of all the obtained reads to the refrence database created in step 1:


`______________________________________________________________________________`

for i in XM_*.fa; do bowtie2 --fast -p 16 -x $i  -1 *_R1.fastq.gz -2 *_R2.fastq.gz -U Single_R.fastq.gz -S $i.sam 

`______________________________________________________________________________`


3. Converting from SAM to BAM and indexing the BAM for data visualization in IGV: 


`______________________________________________________________________________`

for i in XM_*.sam ; do samtools view -bS $i | samtools sort -o $i.sorted.bam ; done

`______________________________________________________________________________`


`______________________________________________________________________________`

for i in XM_*.sorted.bam; do samtools index $i $i.bai; done

`______________________________________________________________________________`



The output was visualized in IGV and PNG of each gene with his covarge was exported.


 
### The output of this analysis ###


**Identification of the genes as genes from the salivary gland using trabscriptomic data**

Blast against the reads using the NCBI platform and against the predicted genes from the reads were not sensitive enough.

Therfore we analysed the obtained reads from the NCBI mapping them against the 13 genes of cathepsin which resulted in:

1. Five genes were reads mapped poorly and inconsistent.

| Gene          | mRNA          | Protein       | Reads Coverage                        | Likelihood of signal peptide     |
| ------------- | ------------- | ------------- | ------------------------------------- | -------------------------------- |
| LOC109031789  | XM_019043541.1| XP_018899086.1| ![LOC109031789](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019043541.1.png)|            0.792                 |
| LOC109032723  | XM_019044995.1| XP_018900540.1| ![LOC109032723](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019044995.1.png)|            0.9549                |
| LOC109032724  | XM_019045001.1| XP_018900546.1| ![LOC109032724](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019045001.1.png))|            0.9551                |
| LOC109040923  | XM_019057048  | XP_018912593.1| ![LOC109040923](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019057048.1.png) |            0.9406                |
| LOC109042262  | XM_019058909.1| XP_018914454.1| ![LOC109042262](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019058909.1.png) |            0.9908                |


2. One of the references catapsine genes had small amounts of reads mapping to it but equally distributed over all the gene.


| Gene          | mRNA          | Protein       | Reads Coverage                        | Likelihood of signal peptide     |
| ------------- | ------------- | ------------- | ------------------------------------- | -------------------------------- |
| LOC109042327  | XM_019059005.1| XP_018914550.1| ![LOC109042327](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019059005.1.png))|              0.2968              |


3. Seven genes had high and equal coverage. 

| Gene          | mRNA          | Protein         | Reads Coverage                        | Likelihood of signal peptide     |
| ------------- | ------------- | --------------- | ------------------------------------- | -------------------------------- |
| LOC109031579  | XM_019043171.1| XP_018898716.1  | ![LOC109031579](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019043171.1.png)|                0.9086            |
| LOC109031589  | XM_019043181.1| XP_018898726.1  | ![LOC109031589](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019043181.1.png)|                0.9472            |
| LOC109032360  | XM_019044441.1|  XP_018899986.1 | ![LOC109032360](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019044441.1.png)|                0.9858            |
| LOC109036811  | XM_019051187.1| XP_018906732.1  | ![LOC109036811](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019051187.1.png)|                0.9726            |
| LOC109039209  | XM_019054602.1| XP_018910147.1  | ![LOC109039209](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019054602.1.png)|                0.998             |
| LOC109042507  | XM_019059295.1| XP_018914840.1  | ![LOC109042507](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019059295.1.png)|                0.9798            |
| LOC109042510  | XM_019059300.1| XP_018914845.1  | ![LOC109042510](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/igv_XM_019059300.1.png)|                0.8032            |


**Identification of the genes as genes from the salivary gland using signal peptides**

All seven well aligned genes had a likelihood of signal peptide above 0.8032. 

[Results PDF for the analysis](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Results/SignalP%20-%205.0%20-%20Services%20-%20DTU%20Health%20Tech.pdf)


### Supplementary Data: ###

[Genes simmilarity analysis](https://github.com/KseniaJuravel/B.tabaci_salivary_glands/blob/main/Multiple_alignment_distance_matrix_cathepsin_genes.html): Information about the precentage of identity between the cathepsin B and L genes.

[BLAST output file for step 3 in the general wokflow](LIMK)

[BLAST output file for step 4 in the general wokflow](LIMK)


### Who do I talk to? ###

* Repo membares or admin

