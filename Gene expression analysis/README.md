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
