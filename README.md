
---

# Gonadal RNA-seq and Differential Alternative Splicing Analysis in *Trachemys scripta*

This repository contains scripts and workflow details for RNA-seq analysis and differential alternative splicing detection in the gonads of the red-eared slider turtle (*T. scripta*), with a focus on temperature-dependent sex determination (TSD) and the role of **Rbm20**.

## Overview

We analyzed gonadal transcriptomes from *T. scripta* under different temperature conditions and genetic backgrounds to explore gene expression patterns and alternative splicing events associated with sex determination.

## Data Sources

* **Gonadal Transcriptomes (Stages 15-18, 21):**
  Available from NCBI under BioProject [PRJNA331105](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA331105).

* **RNA-seq Data for This Study:**

  * Stage 16 gonads from:

    * **FPT** (*Female-Producing Temperature*)
    * **MPT** (*Male-Producing Temperature*)
    * **Rbm20-KD MPT** (*RBM20 Knockdown at Male-Producing Temperature*)
  * Three biological replicates per group
  * Sequenced on Illumina HiSeq 2000 (150 bp paired-end reads)
  * Yield: \~52-68 million high-quality reads per library
  * Gonadal RNA-seq dataset: https://doi.org/10.5281/zenodo.15714696  
## Analysis Pipeline

### 1. Gene Expression Profiling

* **Reference Genome:**
  *T. scripta* genome and annotation: [GCF\_013100865.1\_CAS\_Tse\_1.0](https://www.ncbi.nlm.nih.gov/assembly/GCF_013100865.1)

* **Tools Used:**

  * [HISAT2](https://daehwankimlab.github.io/hisat2/) (v2.2.1) for read alignment
  * [Samtools](http://www.htslib.org/) (v1.6) for SAM/BAM file processing
  * [StringTie](https://ccb.jhu.edu/software/stringtie/) (v2.2.1) for transcript abundance estimation
  * [tximport](https://bioconductor.org/packages/release/bioc/html/tximport.html) (v1.26.0) for importing expression data into R (v4.2.1)
  * Gene-level quantification with **tx2gene**
  * Differential expression analysis performed with [Ballgown](https://bioconductor.org/packages/release/bioc/html/ballgown.html) (v4.2.0)
  * FDR threshold set at 5% for significance

### 2. Differential Alternative Splicing (AS) Analysis

* **Quantification:**

  * Reads aligned and quantified using [Salmon](https://salmon.readthedocs.io/en/latest/) (v1.9.0)

* **AS Event Detection:**

  * Conducted with [SUPPA2](https://github.com/comprna/SUPPA) (v2.3) following the [official tutorial](https://github.com/comprna/SUPPA/wiki/SUPPA2-tutorial)

* **Splicing Metrics:**

  * PSI (Percent Spliced-In) values computed for each AS event
  * Differential splicing evaluated by:

    * ΔPSI (mean PSI difference)
    * P-values from independent t-tests comparing PSI between groups



## Dependencies

Ensure the following tools and versions are installed:

| Tool      | Version |
| --------- | ------- |
| HISAT2    | 2.2.1   |
| Samtools  | 1.6     |
| StringTie | 2.2.1   |
| tximport  | 1.26.0  |
| R         | 4.2.1   |
| Ballgown  | 4.2.0   |
| Salmon    | 1.9.0   |
| SUPPA2    | 2.3     |




