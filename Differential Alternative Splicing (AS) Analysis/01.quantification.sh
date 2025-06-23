for i in F16_1 F16_2 F16_3 M16_1 M16_2 M16_3 R16_1 R16_2 R16_3 
do
mkdir $i
cd $i

nohup /software/salmon-1.9.0_linux_x86_64/bin/salmon  quant -i /RBM20/RNA-seq/suppa2/00.ref.gene/Chrysemys_scripta_index -l A --gcBias -1 /RBM20/00.data/$i.L1_1.fq.gz  -2 /RBM20/00.data/$i.L1_2.fq.gz -p 20 -o /RBM20/RNA-seq/suppa2/01.quantification.deleteRI/$i  > $i.log 2>&1 &
cd ../
done
