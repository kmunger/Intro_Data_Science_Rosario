


##start with a short document
sampletxt <- "The police with their policing strategy instituted a policy of general 
iterations at the Data Science Institute in 2016."

##Tokenize the text  -- do this 3 times, using different options how to tokenize (punctuation)

tokenz<-tokens(sampletxt)
tokenz<-tokens(sampletxt,remove_numbers = T)
tokenz<-tokens(sampletxt, remove_punct = T)

?tokens

## stem the tokens

tokenz_stemmed<-tokens_wordstem(tokenz)

tokenz_stemmed$text1
## Using the entire sampletxt object, select the first two words with "substr()"

substr(sampletxt, 1, 10)
?substr



install.packages("quanteda")
library(quanteda)

inaug<-data_corpus_inaugural

# Load the State of the Union corpus


summary(inaug)

##how many speeches were given by Presidents named James?

sum(inaug$documents$FirstName == "James")



##What percentage of speeches were given by Presidents named James?

sum(inaug$documents$FirstName == "James")/length(inaug$documents$FirstName)




# which speech uses the most types?
summ<-summary(inaug)

which.max(summ$Types)

summ$Text[14]



## extract the text of the last document in the corpus
last_text<-inaug$documents$texts[-1]



# create a sub-corpus that contains all of Bush's speeches

bushes<-corpus_subset(inaug, President == "Bush")


## create a document-feature matrix with these speeches

bush_dfm<-dfm(bushes)


## create a document-feature matrix with these speeches -- removing stop words
bush_dfm<-dfm(bushes, remove = stopwords("english"))



##reweight this document-feature matrix using tfidf weights
bush_tfidf<-dfm_tfidf(bush_dfm)

################################################################

##Use the NYT API to search for all instances of the word "Colombia" from the beginning of 2010 to the end of 2016
apikey <- '9490272d7550435ba8654c33c7846f54'
library(httr)
base_url <- "http://api.nytimes.com/svc/search/v2/articlesearch.json"

r <- GET(base_url, query=list(q="Venezuela","api-key"='9490272d7550435ba8654c33c7846f54'))


###get the number of times "Colombia" is mentioned

nyt_count <- function(q, date1, date2){
  r <- GET(base_url, query=list(q=q,
                                "api-key"='9490272d7550435ba8654c33c7846f54',
                                "begin_date"=date1,
                                "end_date"=date2))
  json <- content(r, "parsed")
  return(json$response$meta$hits)
}

nyt_count(q="inequality", date1=20100101, date2=20161231)


################################################################


##in the first day of class, we used the file humansofnewyork.csv. Read that file into R as a data frame

##read the code in Intro_Data_Science_Rosario/code/intro_R/intro_R_3.html

# What is the content of the post with the lowest number of shares?

# What is the total number of shares that the page has ever received, excluding its most popular post

# What was the date in which the first video was posted?
