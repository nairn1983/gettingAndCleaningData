# Run the analysis required for the "Getting and Cleaning Data" project.
# This assumes that the required set has been downloaded into the same
# directory as this script.
#
# param datasetFilename: the filename of the Samsung Galaxy S accelerometer
#   dataset, which has been downloaded from, e.g., https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# returns the average of each mean() and std() measurement, grouped by activity and subject
runAnalysis <- function(datasetFilename) {
    if(!file.exists(datasetFilename)) {
        stop(paste("File", datasetFilename, "does not exist", sep = " "))
    }
    
    unzip(datasetFilename)
    
    data <- readAndCombineData()
    data <- extractMeanAndStdDevMeasurements(data)
    data <- labelActivities(data)
    data <- averageByActivityAndSubject(data)
    
    unlink("UCI HAR Dataset", recursive = TRUE)
    
    data
}

readAndCombineData <- function() {
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
    activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
    activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
    
    features <- make.names(getFeatures())
    
    data <- rbind(cbind(subject_test, activity_test, X_test),
                  cbind(subject_train, activity_train, X_train))
    colnames(data) <- c("subject", "activity", features)
    
    data
}

getFeatures <- function() {
    as.character(read.table("UCI HAR Dataset/features.txt")$V2)
}

getActivityLabels <- function() {
    read.table("UCI HAR Dataset/activity_labels.txt")
}

labelActivities <- function(data) {
    activityLabels <- getActivityLabels()
    result <- data
    result$activity <- activityLabels$V2[data$activity]
    
    result
}

extractMeanAndStdDevMeasurements <- function(data) {
    features <- getFeatures()
    
    features.mean <- grep("mean\\(\\)", features)
    features.std <- grep("std\\(\\)", features)
    features.index <- sort(c(features.mean, features.std))
    features <- make.names(features[features.index])
    
    data[,c("subject", "activity", features)]
}

averageByActivityAndSubject <- function(data) {
    aggregate(. ~ activity + subject, data = data, FUN = mean)
}