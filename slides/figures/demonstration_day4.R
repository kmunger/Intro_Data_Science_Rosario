
toyDfm <- matrix(c(3,2,1,2,2, 2,1,0,1,2), nrow=2, byrow=TRUE)
colnames(toyDfm) <- c("Gilbert", "hurricane", "rain", "storm", "winds")
rownames(toyDfm) <- c("doc1", "doc2")
toyDfm
simil(toyDfm, "cosine")
simil(toyDfm, "eJaccard")
simil(toyDfm, "Pearson")
dist(toyDfm, "Euclidean")
dist(tf(toyDfm), "Euclidean")  # on normalized term frequencies
summary(pr_DB)


inaugCorpusObama <- subset(inaugCorpus, year>2008)
collocObama <- collocations(inaugCorpusObama, top=50)
inaugCorpusBush <- subset(inaugCorpus, year>2000 & year <=2008)
collocBush <- collocations(inaugCorpusObama, top=50)
collocBushChi2 <- collocations(inaugCorpusObama, top=50, method="chi2")

data(iebudgets)
iebudgetsBurton <- subset(iebudgets, speaker=="Burton")
collocations(getTexts(iebudgetsBurton), top=50)

data(inaugCorpus)
inaugCorpusBushObama <- subset(inaugCorpus, year>2000)
summary(inaugCorpusBushObama)
inaugDfm_nostem <- dfm(inaugCorpusBushObama)
length(words(inaugDfm_nostem))
round(simil(inaugDfm_nostem, "cosine"), 4)
inaugDfm_stem <- dfm(inaugCorpusBushObama, stem=TRUE)
length(words(inaugDfm_stem))
round(simil(inaugDfm_stem, "cosine"), 4)

round(simil(tfidf(inaugDfm_nostem), "cosine"), 4)
round(simil(tfidf(inaugDfm_stem), "cosine"), 4)

