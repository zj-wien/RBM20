#Generate the ioe files:
#conda activate SUPPA
/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py generateEvents -i /RBM20/RNA-seq/suppa2/00.ref.gene/formatted/Trachemys_scripta.formatted.deleteRI.gtf  -o Trachemys_scripta.events -e SE SS MX RI FL -f ioe

#Put all the ioe events in the same file:
awk '
FNR==1 && NR!=1 { while (/^<header>/) getline; }
1 {print}
' *.ioe > Trachemys_scripta.events.ioe


/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py psiPerEvent -i Trachemys_scripta.events.ioe -e /RBM20/RNA-seq/suppa2/01.quantification.deleteRI/iso_tpm_formatted.txt -o RBM20_events

