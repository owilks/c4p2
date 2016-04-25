README
=======================================

Source
-----------------------

run_analsis.R uses the data from: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", This data was accessed on 4/15/2016


The step by step procedure follows
-----------------------

1. Download the data and unzip the underlying file
2. Store the respective .txt filse as data frames within R Studio (latest version to date)
  "x_train.txt","y_train.txt","subject_train.txt","x_test.txt""y_test.txt" "subject_test.txt"
3. Combine the initial data sets from the respective test and train groups,subect|s,y,x respectively.
4. Store the column name data from "features.txt" as the names for the newly combined x data (xtot)
5. Using grep on the name(xtot) isolate all columns in the data that deal with std or mean data, the final output is xcut.
6. Store the column name data from activity_labels as the names for the newly combined y data (ytot)
7. Combine all the data lists with cbind to create the final data set "tot"
8. Create an additional data set that

