#conda activate SUPPA

#Run SUPPA2 for obtaining the ioi file from the annotation
/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py generateEvents -f ioi -i /RBM20/RNA-seq/suppa2/00.ref.gene/formatted/Trachemys_scripta.formatted.gtf -o Trachemys_scripta.isoforms

/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py psiPerIsoform -g /RBM20/RNA-seq/suppa2/00.ref.gene/formatted/Trachemys_scripta.formatted.gtf -e ../01.quantification/iso_tpm_formatted.txt -o ./iso

#Split the PSI files between 2 conditions:
Rscript /software/SUPPA-master/scripts/split_file.R ./iso_isoform.psi F16_1,F16_2,F16_3 M16_1,M16_2,M16_3 F16_iso.psi M16_iso.psi -i
Rscript /software/SUPPA-master/scripts/split_file.R ./iso_isoform.psi F16_1,F16_2,F16_3 R16_1,R16_2,R16_3 F16_iso.psi R16_iso.psi -i


#Run SUPPA2
/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py diffSplice -m empirical -gc -i ./Trachemys_scripta.isoforms.ioi -p F16_iso.psi M16_iso.psi -e ../03.diff_splicing/F16_iso.tpm ../03.diff_splicing/M16_iso.tpm -o F16_M16.diffSplice_iso

/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py diffSplice -m empirical -gc -i ./Trachemys_scripta.isoforms.ioi -p R16_iso.psi M16_iso.psi -e ../03.diff_splicing/R16_iso.tpm ../03.diff_splicing/M16_iso.tpm -o R16_M16.diffSplice_iso


