# gettingAndCleaningData

This repository contains the necessary files for the Coursera [Getting and Cleaning Data](https://class.coursera.org/getdata-032/) project assignment. This consists of the R script used to obtain the dataset used in the submission for this project, along with the codebook describing it.

## Using the R analysis script

Running the script in R assumes that the Samsung Galaxy S accelerometer data has been downloaded into the same directory as the instance of R that the user is currently running. One can obtain this data by downloading from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Assuming that this has been saved to a file named `dataset.zip`, the summarised data can be obtained in R by loading the `run_analysis.R` script and calling the `runAnalysis` function:

```
source("run_analysis.R")
data <- runAnalysis("dataset.zip")
```

The resulting summarised dataset will then be stored in the `data` object. Any files created by running this function will be deleted before it completes.

## Codebook

To do.
