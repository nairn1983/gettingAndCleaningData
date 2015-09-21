# gettingAndCleaningData

This repository contains the necessary files for the Coursera [Getting and Cleaning Data](https://class.coursera.org/getdata-032/) project assignment. This consists of the R script used to obtain the dataset used in the submission for this project, along with the codebook describing it.

## About the R analysis script

This script extracts the Samsung Galaxy S accelerometer data provided for the course project. For each activity type (laying, standing, sitting, walking, walking downstairs and walking upstairs) and for each of 30 test subjects for which this data is available, the script takes all features for which the mean and standard deviation are recorded, and obtains the mean value for each.

## Using the R analysis script

Running the script in R can be done by following the following steps:

* Clone this Git repository into a directory of your choosing:
```
git clone https://github.com/nairn1983/gettingAndCleaningData.git
```  
  
* Download the zip file containing the Samsung Galaxy S accelerometer data into the same directory that the Git repository has been cloned into. This data can be obtained by downloading from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* From the R command line, set the working directory to the repository in question. Then load the `run_analysis.R` script and call the `runAnalysis` function. Assuming that the data has been saved to a file, `dataset.zip`, in the `~/gettingAndCleaningData` directory, we can execute the following statements.  
```
setwd("~/gettingAndCleaningData")
source("run_analysis.R")
data <- runAnalysis("dataset.zip")
```

The resulting summarised dataset will then be stored in the `data` object. Any files created by running this function will be deleted before it completes.

## Codebook

To do.
