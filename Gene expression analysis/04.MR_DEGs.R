library(ballgown)
library(RSkittleBrewer)
library(genefilter)
library(dplyr)
library(devtools)


pheno_data = read.csv("MR_phenodata.csv")
BO_ject = ballgown(dataDir = ".", samplePattern = "L1", pData=pheno_data)
BO_ject_filt = subset(BO_ject,"rowVars(texpr(BO_ject)) >1",genomesubset=TRUE)


write.csv(texpr(BO_ject_filt,meas="all"),"MR.FPKM.info.csv",row.names=FALSE)
write.csv(gexpr(BO_ject_filt),"MR.gene.FPKM.info.csv")


results_transcripts = stattest(BO_ject_filt,feature="transcript",covariate="sex",getFC=TRUE, meas="FPKM")
results_transcripts = data.frame(geneNames=ballgown::geneNames(BO_ject_filt),geneIDs=ballgown::geneIDs(BO_ject_filt), results_transcripts)
results_transcripts = arrange(results_transcripts,pval)
write.csv(subset(results_transcripts,(results_transcripts$pval<0.05)),"MR.transcript_results.p0.05.csv")
write.csv(results_transcripts,"MR.transcript_results.csv")


results_genes = stattest(BO_ject_filt, feature="gene",covariate="sex",getFC=TRUE, meas="FPKM")
results_genes = arrange(results_genes,pval)
write.csv(subset(results_genes,(results_genes$pval<0.05)), "MR.gene_results.p0.05.csv",row.names=FALSE)
