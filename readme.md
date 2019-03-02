### Getting and Cleaning Data Course Project
Below are the contents of this repo:

* First, this repo includes a readme.md, for a list of all files.

* Second, this repo contains the required R script, named as "run_analysis.R"

* Third, the required tidy dataset is uploaded, named as "prj_data_tidy"

* Fourth, here is a code book for explaination of all the variables used for the output data.


For the R script, the follow steps were done to produce the final tidy dataset:
* read in data/subject/activity_label for test datasets, and combined together
* read in data/subject/activity_label for train datasets, and combined together
* combined test and train datasets together
* replace activity labels by descriptive activity names
* only keep the variables containing average or standard deviation for each measurement
* calculate the average for each variable of each subject and each activity
* write the output dataset
