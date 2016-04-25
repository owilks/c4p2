#Downloading the respective data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "c4p2.zip")

#Loading libraries
library(dplyr)
library(tidyr)

#Extraction
#unzip("c4p2.zip")

#Storing necessary data
xtrain<- read.table("./UCI HAR Dataset/train/x_train.txt")
ytrain<- read.table("./UCI HAR Dataset/train/y_train.txt")
strain<- read.table("./UCI HAR Dataset/train/subject_train.txt")

xtest<- read.table("./UCI HAR Dataset/test/x_test.txt")
ytest<- read.table("./UCI HAR Dataset/test/y_test.txt")
stest<- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Test length of variables
length(xtrain[,1])
length(ytrain[,1])
length(strain[,1])

length(xtest[,1])
length(ytest[,1])
length(stest[,1])

#Combining the train and test data sets
xtot <- rbind(xtrain,xtest)
ytot <- rbind(ytrain,ytest)
stot <- rbind(strain,stest)

#Updating table names
col <- read.table("./UCI HAR Dataset/features.txt")
names(xtot) <- col[,2]

#Isolating and selecting mean & std columns
loc <- grepl("mean()|std()",names(xtot))
xcut <- xtot[loc]

#Replacing activity names
act <- read.table("./UCI HAR Dataset/activity_labels.txt")
ytot<- merge(ytot,act,all=TRUE)
ytot<- ytot[,2]

#Combining it all, updating names
tot<- cbind(stot,ytot,xcut)
names(tot)[1] <-"subject"
names(tot)[2] <-"activity"

avgtot <- tot %>% group_by(subject,activity) %>% summarize_each(funs(mean), vars = c(-subject,-activity))
