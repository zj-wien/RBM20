# Split the PSI and TPM files between the 2 conditions:
/software/SUPPA-master/scripts/split_file.R ../01.quantification/iso_tpm_formatted.txt F16_1,F16_2,F16_3 M16_1,M16_2,M16_3  F16_iso.tpm M16_iso.tpm -i

/software/SUPPA-master/scripts/split_file.R ../01.quantification/iso_tpm_formatted.txt F16_1,F16_2,F16_3 R16_1,R16_2,R16_3 F16_iso.tpm R16_iso.tpm -i

/software/SUPPA-master/scripts/split_file.R ../02.event_cal/RBM20_events.psi F16_1,F16_2,F16_3 M16_1,M16_2,M16_3 F16_events.psi M16_events.psi -e
/software/SUPPA-master/scripts/split_file.R ../02.event_cal/RBM20_events.psi F16_1,F16_2,F16_3 R16_1,R16_2,R16_3 F16_events.psi R16_events.psi -e



/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py diffSplice -m empirical -gc -i ../02.event_cal/Trachemys_scripta.events.ioe -p F16_events.psi M16_events.psi  -e F16_iso.tpm M16_iso.tpm -o F16_M16.diffSplice

/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py diffSplice -m empirical -gc -i ../02.event_cal/Trachemys_scripta.events.ioe -p F16_events.psi R16_events.psi  -e F16_iso.tpm R16_iso.tpm -o F16_R16.diffSplice

/miniconda3/envs/SUPPA/bin/python /miniconda3/envs/SUPPA/bin/suppa.py diffSplice -m empirical -gc -i ../02.event_cal/Trachemys_scripta.events.ioe -p R16_events.psi M16_events.psi  -e R16_iso.tpm M16_iso.tpm -o R16_M16.diffSplice
