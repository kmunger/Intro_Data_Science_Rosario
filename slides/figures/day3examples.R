## Quantitative Analysis of Quantitative Data
##
## NYU Dept. of Politics short course Fall 2014
## 30 September 2014
##
## Code for examples from Day 2, Descriptive Stats - focus on quanteda copus creation
## Ken Benoit <kbenoit@lse.ac.uk>

# Test resampling

x <- corpus(c("Sentence One C1.  Sentence Two C1.  Sentence Three C1.", 
                     "Sentence One C2.  Sentence Two C2.  Sentence Three C2. Sentence Four C2.  Sentence Five C2.  Sentence Six C2."))
testRS <- resample(x, n=3)
metadoc(testRS)


x <- corpus(c("Sentence One C1.  Sentence Two C1.  Sentence Three C1.", 
              "Sentence One C2.  Sentence Two C2.  Sentence Three C2. Sentence Four C2.  Sentence Five C2.  Sentence Six C2."),
            docnames=c("docTwo", "docOne"))
testRS <- resample(x, n=3)
metadoc(testRS)
testRS$documents


## distances
presDfm <- dfm(subset(inaugCorpus, Year>1980), stopwords=TRUE, stem=TRUE)

library(proxy)
simil(presDfm, "Euclidean")
print(dist(presDfm, "Euclidean"), digits=4)
print(dist(tf(presDfm), "Euclidean"), digits=4)
print(dist(presDfm, "Cosine"), digits=2)
print(dist(tf(presDfm), "Cosine"), digits=2)   # same
print(dist(presDfm, "eJaccard"), digits=2)   # same
print(dist(tf(presDfm), "eJaccard"), digits=2)   # same

summary(pr_DB)   # see all available

# plot the differences with other presidents
obamaDistance <- as.matrix(dist(as.matrix(presDfm), "Cosine"))
dotchart(obamaDistance[1:8,9], xlab="Cosine distance")
obamaDistance <- as.matrix(dist(presDfm, "eJaccard"))
dotchart(obamaDistance[1:8,9], xlab="Jaccard distance")


# create a dfm from inaugural addresses from Reagan onwards
presDfm <- dfm(subset(inaugCorpus, Year>1980), stopwords=TRUE, stem=TRUE)

# compute some document similarities
similarity(presDfm, "1985-Reagan", n=5, margin="documents")
similarity(presDfm, c("2009-Obama" , "2013-Obama"), n=5, margin="documents")
similarity(presDfm, c("2009-Obama" , "2013-Obama"), n=NULL, margin="documents")
similarity(presDfm, c("2009-Obama" , "2013-Obama"), n=NULL, margin="documents", method="cosine")
similarity(presDfm, "2005-Bush", n=NULL, margin="documents", method="eJaccard", sort=FALSE)

# compute some term similarities
similarity(presDfm, c("fair", "health", "terror"), method="cosine")

# compare to tm
require(tm)
data("crude")
crude <- tm_map(crude, content_transformer(tolower))
crude <- tm_map(crude, removePunctuation)
crude <- tm_map(crude, removeNumbers)
crude <- tm_map(crude, stemDocument)
tdm <- TermDocumentMatrix(crude)
findAssocs(tdm, c("oil", "opec", "xyz"), c(0.75, 0.82, 0.1))

# same in quanteda
crudeDfm <- dfm(corpus(crude))
similarity(crudeDfm, c("oil", "opec", "xyz"), normalize=FALSE, digits=2)
# note that tm does not compute similarities between words in the list!
# e.g. "opec" as a word close to "oil"



