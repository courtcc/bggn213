library(bio3d)


fast <- read.fasta('tb.fasta')
head(fast)

align <- read.fasta('aln.fas')
head(align)

ide.mat <- seqidentity(alignment = fast
library(pheatmap)
pheatmap(ide.mat)

con <- consensus(align)
print(con$seq)

top <- blast.pdb(con$seq, database = 'pdb')
head(top$hit.tbl,3)
head(top$raw)


top2 <- blast.pdb(fast, database = 'pdb')
head(top2$hit.tbl,3)
