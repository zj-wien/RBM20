date
for i in F16_1.L1 F16_2.L1 F16_3.L1 M16_1.L1 M16_2.L1 M16_3.L1 R16_1.L1 R16_2.L1 R16_3.L1
do
mkdir $i
nohup sh estimate_abundances.sh  /RBM20/03.expression/01.hisat2.stringtie/$i/$i.sort.bam /RMB20/02.annotation/Trachemys_scripta/GCF_013100865.1_CAS_Tse_1.0_genomic.deleteRI.gff $i /RBM20/03.expression/02.ballgown.release.deleteRI > $i/$i.log 2>&1  &
done
