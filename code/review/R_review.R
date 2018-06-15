


##start with a short document
sampletxt <- "The police with their policing strategy instituted a policy of general 
iterations at the Data Science Institute in 2016."

##Tokenize the text  -- do this 3 times, using different options how to tokenize (punctuation)


## stem the tokens


## Using the entire sampletxt document, select the first two words with "substr()"


# Load the State of the Union corpus

##how many speeches were given by Presidents from the Whig party?

##What percentage of speeches were given by Presidents from the Whig party?

# which speech uses the most types?

# what is the mean number of types used by Democrats? By Republicans?

# what is the median number of types used by Whigs? 


## extract the text of the last document in the corpus


# create a sub-corpus that contains all of Obama's speeches

## create a document-feature matrix with these speeches


## create a document-feature matrix with these speeches -- removing stop words

## create a document-feature matrix with these speeches -- with only terms that appear in at least 5 documents



##reweight this document-feature matrix using tfidf weights

## use grepl on the entire corpus to find all of the speeches that contain the word "America"

################################################################

##Use the NYT API to search for all instances of the word "Colombia" from the beginning of 2010 to the end of 2016
##Do the search by year

##Do the same for the word "Venezuela" from the beginning of 2010 to the end of 2016

#In which years was "Colombia" mentioned more often than "Venezuela"?

################################################################


##in the first day of class, we used the file humansofnewyork.csv. Read that file into R as a data frame

# What is the content of the post with the lowest number of shares?

# What is the total number of shares that the page has ever received, excluding its most popular post

# What was the date in which the first video was posted?
