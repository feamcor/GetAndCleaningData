##
## Coursera Data Science Specialization
## Course: Getting and Cleaning Data
## Course Instance: getdata-033
## Assignment: Course Project
## Student: Fabio Correa (feamcor)
##

rm(list = ls()) # clear environment

library(methods)
library(lubridate)
library(reshape2)
library(dplyr, warn.conflicts = FALSE)

start.time <- now()
start.time.text <- format(start.time, "_%Y%m%d_%H%M%S")
script.name <- "run_analysis"

##
## One of the most exciting areas in all of data science right now
## is wearable computing. Companies like Fitbit, Nike, and Jawbone Up
## are racing to develop the most advanced algorithms to attract new users.
## The data linked to from the course website represent data collected from
## the accelerometers from the Samsung Galaxy S smartphone.
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##

message(paste(now(), "Script started! timezone =", Sys.timezone()))

rdata.filename <- file.path(".", paste0(script.name, ".RData"))
if(file.exists(rdata.filename)) {
    load(rdata.filename)
    message(paste(now(), "Dataset last download on", dataset.download))
}

filename <- file.path(".", "UCI HAR Dataset.zip")
if(!file.exists(filename)) {
    dataset.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    ## dataset.url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
    download.file(url = dataset.url, destfile = filename, method = "auto")
    dataset.download = now()
    save(dataset.download, file = rdata.filename)
}

dirname <- file.path(".", "UCI HAR Dataset")
if(!dir.exists(dirname)) {
    message(paste(now(), "Unzipping dataset file", filename))
    unzip(filename, overwrite = TRUE)
}

##
## You should create one R script called run_analysis.R that
## does the following:
##
## 1. Merges the training and the test sets to create one data set.
##

filename <- file.path(dirname, "test", "X_test.txt")
observations.1 <- read.table(filename,
                             header = FALSE,
                             sep = "",
                             dec = ".",
                             numerals = "warn.loss",
                             colClasses = "numeric",
                             blank.lines.skip = TRUE)
message(paste(now(), "Read", nrow(observations.1), "observations!", filename))

filename <- file.path(dirname, "train", "X_train.txt")
observations.2 <- read.table(filename,
                             header = FALSE,
                             sep = "",
                             dec = ".",
                             numerals = "warn.loss",
                             colClasses = "numeric",
                             blank.lines.skip = TRUE)
message(paste(now(), "Read", nrow(observations.2), "observations!", filename))

observations <- rbind(observations.1, observations.2)
message(paste(now(), "Merged", nrow(observations), "observations! (#1 completed)"))

##
## 2. Extracts only the measurements on the mean and
##    standard deviation for each measurement.
##

filename <- file.path(dirname, "features.txt")
features <- read.table(filename,
                       header = FALSE,
                       sep = "",
                       col.names = c("i", "feature"),
                       colClasses = c("integer", "character"),
                       blank.lines.skip = TRUE)
message(paste(now(), "Read", nrow(features), "features!", filename))

features.subset.logical <- grepl("-(mean|std)\\(\\)-[XYZ]$", features$feature)
features.subset <- features[features.subset.logical, ]
message(paste(now(), "Only", nrow(features.subset), "features required!"))

final <- observations[, features.subset.logical]
message(paste(now(),
              nrow(final), "observations of",
              ncol(final), "features! (#2 completed)"))

##
## 3. Uses descriptive activity names to name the activities in the data set.
##

filename <- file.path(dirname, "activity_labels.txt")
activities.labels <- read.table(filename,
                                header = FALSE,
                                col.names = c("activity", "description"),
                                colClasses = c("integer", "character"),
                                blank.lines.skip = TRUE)
message(paste(now(),
              "Read", nrow(activities.labels), "activity labels!",
              filename))

filename <- file.path(dirname, "test", "y_test.txt")
activities.1 <- read.table(filename,
                           header = FALSE,
                           col.names = c("activity"),
                           colClasses = c("integer"),
                           blank.lines.skip = TRUE)
message(paste(now(),
              "Read", nrow(activities.1), "activity observations!",
              filename))

filename <- file.path(dirname, "train", "y_train.txt")
activities.2 <- read.table(filename,
                           header = FALSE,
                           col.names = c("activity"),
                           colClasses = c("integer"),
                           blank.lines.skip = TRUE)
message(paste(now(),
              "Read", nrow(activities.2), "activity observations!",
              filename))

activities <- rbind(activities.1, activities.2)
message(paste(now(), "Merged", nrow(activities), "activity observations!"))

final <- cbind(final, activity = activities.labels[activities$activity, 2])
message(paste(now(), "Added descriptive activity into dataset! (#3 completed)"))

##
## 4. Appropriately labels the data set with descriptive variable names.
##

features.subset$tidy <- features.subset$feature
features.subset$tidy <- sub("^(.*?)Acc(.*?)$",
                            "acc_\\1\\2",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(.*?)Gyro(.*?)$",
                            "gyr_\\1\\2",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)t(.*?)$",
                            "\\1time_\\2",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)f(.*?)$",
                            "\\1freq_\\2",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)(time_|freq_)BodyJerk(.*?)$",
                            "\\1\\2jerk_\\3",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)(time_|freq_)Body(.*?)$",
                            "\\1\\2body_\\3",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)(time_|freq_)Gravity(.*?)$",
                            "\\1\\2grav_\\3",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)(time_|freq_)(jerk_|body_|grav_)(.*?)-([XYZ])$",
                            "\\1\\2\\3\\L\\5_\\4",
                            features.subset$tidy, perl = TRUE)
features.subset$tidy <- sub("^(acc_|gyr_)(time_|freq_)(jerk_|body_|grav_)([xyz]_)-(mean|std).*?$",
                            "\\1\\2\\3\\4\\5",
                            features.subset$tidy, perl = TRUE)
colnames(final) <- features.subset$tidy
colnames(final)[nrow(features.subset) + 1] <- "activity"
message(paste(now(), "Set descriptive feature names! (#4 completed)"))

filename <- file.path(".", paste0(script.name, start.time.text, "_4.csv"))
write.csv(final, file = filename, row.names = FALSE)
message(paste(now(), "Generated output!", filename))

##
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
##

filename <- file.path(dirname, "test", "subject_test.txt")
subjects.1 <- read.table(filename,
                         header = FALSE,
                         col.names = c("subject"),
                         colClasses = c("integer"),
                         blank.lines.skip = TRUE)
message(paste(now(),
              "Read", nrow(subjects.1), "subject observations!",
              filename))

filename <- file.path(dirname, "train", "subject_train.txt")
subjects.2 <- read.table(filename,
                         header = FALSE,
                         col.names = c("subject"),
                         colClasses = c("integer"),
                         blank.lines.skip = TRUE)
message(paste(now(),
              "Read", nrow(subjects.2), "subject observations!",
              filename))

subjects <- rbind(subjects.1, subjects.2)
message(paste(now(), "Merged", nrow(subjects), "subject observations!"))

final <- cbind(final, subject = subjects)
message(paste(now(), "Added subject into dataset!"))

tidy <- melt(final, id.vars = c("activity", "subject"), value.name = "signal")
tidy.vars <- data.frame(do.call("rbind",
                                strsplit(as.character(tidy$variable),
                                         split = "_",
                                         fixed = TRUE)))
tidy$variable <- NULL
colnames(tidy.vars) <- c("device", "domain", "source", "axis", "type")
tidy <- cbind(tidy, tidy.vars)
message(paste(now(),
              "Tidy", ncol(tidy), "variables and",
              nrow(tidy), "observations generated!"))

filename <- file.path(".", paste0(script.name, start.time.text, "_5.csv"))
write.csv(tidy, file = filename, row.names = FALSE)
message(paste(now(), "Generated output!", filename))

tidy.summary <- tbl_df(tidy) %>%
     group_by(activity, subject, device, domain, source, axis, type) %>%
     summarise(avg_signal = mean(signal))
message(paste(now(),
              "Summary of tidy dataset of", ncol(tidy.summary), "variables",
              "and", nrow(tidy.summary), "observations generated!"))

filename <- file.path(".", paste0(script.name, start.time.text, ".txt"))
write.table(tidy.summary, file = filename, row.names = FALSE)
message(paste(now(), "Generated output! (#5 completed)", filename))

message(paste(now(), "Script finished!"))
#rm(list = ls())
