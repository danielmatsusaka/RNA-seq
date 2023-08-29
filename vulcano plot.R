df<-read.csv(file.choose(),header = TRUE, na.strings = "NA",",")
attach(df)

df



df<-df[which(rowSums(df)>0),]
df
#if (!requireNamespace('BiocManager', quietly = TRUE))
#  install.packages('BiocManager')

#BiocManager::install('EnhancedVolcano')

library(EnhancedVolcano)


#install.packages("airway")
#install.packages("magrittr")

library(magrittr)


#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("airway")
library(airway)

data('airway')


airway$dex %<>% relevel('untrt')


EnhancedVolcano(df,
                lab = rownames(df),
                x = 'logFC',
                y = 'FDR',
                title = 'Differential expression',
                
                pCutoff = 10e-5,
                FCcutoff = 1,
                pointSize = 3.0,
                labSize = 3.0,
                colAlpha = 0.5,
                legendLabels=c('Not sig.','Log (base 2) FC','adj P-value',
                               'adj P-value & Log (base 2) FC'),
                legendPosition = 'right',
                legendLabSize = 16,
                legendIconSize = 5.0)

               )

EnhancedVolcano(df,
                lab = df$Transcripts,
                x = 'logFC',
                y = 'FDR',
                title = 'Differential expression',
                selectLab = c('PGSC0003DMT400007904','PGSC0003DMT400033385','PGSC0003DMT400041726',
                              'PGSC0003DMT400046636','PGSC0003DMT400017206','PGSC0003DMT400081406',"PGSC0003DMT400073455","PGSC0003DMT400050441","PGSC0003DMT400003364","PGSC0003DMT400013094"),
                xlab = bquote(~Log[2]~ 'fold change'),
                labCol = 'black',
                labFace = 'bold',
                ylab = "-log10 (FDR)",
                boxedLabels = TRUE,
                drawConnectors = TRUE,
                widthConnectors = 1.0,
                pCutoff = 10e-5,
                FCcutoff = 1,
                pointSize = 3.0,
                labSize = 3.0,
                colAlpha = 0.5,
                legendLabels=c('not significant','log2 (fold change) ','FDR',
                               'FDR & log2 (fold change)'),
                legendPosition = 'right',
                legendLabSize = 16,
                legendIconSize = 5.0)



EnhancedVolcano(df,
                lab = df$Transcripts,
                x = 'logFC',
                y = 'FDR',
                labs(x="log2(fold change)",
                     y="-log10 (FDR)",
                selectLab = c('PGSC0003DMT400007904','PGSC0003DMT400033385','PGSC0003DMT400041726',
                              'PGSC0003DMT400046636','PGSC0003DMT400017206','PGSC0003DMT400081406',"PGSC0003DMT400073455","PGSC0003DMT400050441","PGSC0003DMT400003364","PGSC0003DMT400013094"),
                xlab = bquote(~Log[2]~ 'fold change'),
                labCol = 'black',
                labFace = 'bold',
                boxedLabels = TRUE,
                drawConnectors = TRUE,
                widthConnectors = 1.0,
                pCutoff = 10e-5,
                FCcutoff = 1,
                pointSize = 3.0,
                labSize = 3.0,
                colAlpha = 0.5,
                legendLabels=c('Not sig.','Log (base 2) FC','FRD',
                               'FRD & Log (base 2) FC'),
                legendPosition = 'right',
                legendLabSize = 16,
                legendIconSize = 5.0)

)

library(ggplot2)


