#$1 = bam
#$2 = reference annotation
#$3 = sample_name
#$4 = outdir

date
mkdir -p $4/$3
cd $4/$3

/public/home/miniconda3/bin/stringtie -e -B -P 8 -G $2 -o $3.ballgown.gtf $1

date
