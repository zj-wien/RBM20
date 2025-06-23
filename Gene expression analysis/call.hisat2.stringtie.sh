#$1 = fq1_path
#$2 = fq2_path
#$3 = sample_name
#$4 = outdir

date
mkdir $4/$3
cd $4/$3

/public/home/miniconda3/bin/hisat2 -x RMB20/01.genome/Trachemys_scripta -p 8 -1 $1 -2 $2  -S $4/$3/$3.sam
samtools sort $4/$3/$3.sam   -@ 8 -O BAM -o $4/$3/$3.sort.bam
samtools index $4/$3/$3.sort.bam

date
