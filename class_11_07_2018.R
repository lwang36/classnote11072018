# If gene ids are in form of Ensembl ids, then one can use "BiomaRt" library.
# Gene set enrichment

library("biomaRt") # load library biomaRt

# using homo sapiens annotation file by function useMart
ensembl <- useMart("ensembl", dataset="hsapiens_gene_ensembl")

my_chr <- c(1:22, 'M','X','Y')
my_chr

#Function (getBM) to get features form biomaRt library
my_ensembl_gene <- getBM(attributes='ensembl_gene_id', filters='chromosome_name',
values=my_chr, mart=ensembl)

my_ensembl_gene # get your genes

#ensembl gene id: have some number and gene ID, eg 58639 ENSG00000251970
entrez gene id: only numbers

# Selecting first 5 ensembl gene ids
five_ensembl <- my_ensembl_gene[1:5,]# show you first five row of genes

# function to convert ensembl gene ids to entrez gene ids
five_ensembl_to_entrez <- getBM(attributes=c('ensembl_gene_id', 'entrezgene'),
filters='ensembl_gene_id',values=five_ensembl, mart=ensembl)

# select last 50 genes from object 'my_ensembl_gene' and convert into entrez gene ids,
export two columns into csv file named 'ensembl_to_entrez' and upload on github

last_five_ensembl <- my_ensembl_gene[58590:58639,] or tail(my_ensembl_gene, 50)
or my-ensembl_gene[58639-49:-1,]
last_five_ensembl_to_entrez <- getBM(attributes=c('ensembl_gene_id', 'entrezgene'),
filters='ensembl_gene_id',values=last_five_ensembl, mart=ensembl)

write.csv(last_five_ensembl_to_entrez[,1:2], file = "ensembl_to_entrez",row.names=TRUE)

# select diferent attributes from biomaRt library
my_attribute <- c('entrezgene', 'hgnc_symbol', 'chromosome_name', 'start_position',
'end_position', 'strand')

# my_entrez_gene object has entrez gene ids with chromosome names
my_entrez_gene <- getBM(attributes = 'entrezgene',
filters = 'chromosome_name', values = my_chr, mart=ensembl)


my_entrez_gene_info <- getBM(attributes=my_attribute,
filters = c('entrezgene', 'chromosome_name'),
values = list(entrezgene = my_entrez_gene$entrezgene, chromosome_name=my_chr), mart=ensembl)




