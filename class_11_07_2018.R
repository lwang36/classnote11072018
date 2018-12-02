# If gene ids are in form of Ensembl ids, then one can use "BiomaRt" library.
# Gene set enrichment
The biomaRt package, provides an interface to a growing collection of databases implementing the BioMart software suite.
The package enables retrieval of large amounts of data in a uniform way without the need to know the underlying database schemas 
or write complex SQL queries.
library("biomaRt") # load library biomaRt

# using homo sapiens annotation file by function useMart
The useMart() function can now be used to connect to a specified BioMart database
ensembl <- useMart("ensembl", dataset="hsapiens_gene_ensembl")

my_chr <- c(1:22, 'M','X','Y')
my_chr

#Function (getBM) to get features form biomaRt library
The getBM() function has three arguments that need to be introduced: filters, attributes and values.
Filters define a restriction on the query

attributes: is a vector of attributes that one wants to retrieve (= the output of the query).
Attributes define the values we are interested in to retrieve

Filters define a restriction on the query
filters: is a vector of filters that one wil use as input to the query.

values: a vector of values for the filters. In case multple filters are in use,
the values argument requires a list of values where each position in the list corresponds to the position of the filters
in the filters argument.

mart: is an object of class Mart, which is created by the useMart() function
  
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




