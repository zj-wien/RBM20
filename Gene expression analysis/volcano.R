library(ggrepel)
library(ggplot2)
args <- commandArgs(T)

pdf(args[1],height=9,width=9)

data <- read.table(args[2],sep="\t",header = T)

#name	FC	qvalue	AR	CR
#gene	name	FC	logCPM	LR	PValue	qvalue	ZZ15	sg215
#geneNames       id      fc      pval    qval

#data$threshold = as.factor(ifelse(data$qvalue <0.001 & abs(log2(data$FC)) >= 1, ifelse(log2(data$FC) >= 1 ,'Up','Down'),'NoSignifi'))

data$threshold = as.factor(ifelse(-log10(data$pval) > 3.5 & abs(log2(data$FC)) >= 1, ifelse(log2(data$FC) >= 1,'Up','Down'),'NoSignifi'))

ggplot(data = data, aes(x = log2(FC), y = -log10(pval), colour=threshold, label = geneNames)) + geom_point(alpha=0.5, size=5) + scale_color_manual(values=c("blue","grey","red")) + geom_hline(yintercept=3.5,lty=2,col="black",lwd=0.3) + geom_vline(xintercept=1,lty=2,col="black") + geom_vline(xintercept=-1,lty=2,col="black") + labs(x="log2(fold change)",y="-log10(P-value)",title="") + theme(plot.title = element_text(hjust = 0.5), legend.position="right", legend.title = element_blank()) + geom_text_repel( data = subset(data, -log10(data$pval) > 3.5 & abs(log2(data$FC)) >= 1), aes(label = geneNames), size = 3, box.padding = unit(0.5, "lines"), point.padding = unit(0.8, "lines"), segment.color = "#636363", show.legend = FALSE, max.overlaps=20 ) +  theme(plot.title = element_text(hjust = 0.5, vjust=0,size=rel(1.5), family="Times",face="bold")) + theme(axis.text.x = element_text(colour = 'black', angle = 0, size = 15, hjust = 0.5, vjust = 0.5), axis.text.y = element_text( angle = 0, size = 15, hjust = 0.5, vjust = 0.5), axis.title.y = element_text(size = rel(1.5), angle = 90), axis.title.x = element_text(size = rel(1.5), angle = 0))  + theme(legend.position="none")

dev.off()
