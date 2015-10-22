# **Get and Cleaning Data** course project
### Coursera Data Science Specialization

## Introduction
This project comprises of an R script that analyzes dataset from the **Human Activity Recognition** (HAR) database that was built from the recordings of 30 subjects performing **Activities of Daily Living** (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

For more information about the dataset and the research behind it, click [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Installation
You can clone this repo using the command below :
```
git clone https://github.com/feamcor/GetAndCleaningData.git
```
or simply download the latest version of the [script](https://raw.githubusercontent.com/feamcor/GetAndCleaningData/master/run_analysis.R) to your machine.

## Dependencies
The script depends on the following packages :

*  [lubridate](https://cran.r-project.org/web/packages/lubridate/index.html) >= 1.3.3
*  [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html) >= 0.4.3
*  [reshape2](https://cran.r-project.org/web/packages/reshape2/index.html) >= 1.4.1

## How to Run
Simply source the script from within the R interpreter :
```R
setwd("path/where/script/is/located")
source("run_analysis.R")
```

Or run it straight from the command-line :
```
cd path/where/script/is/located
Rscript run_analysis.R
```

> **Note** : change path according to configuration of your machine.

The script generates diagnostic messages to stderr in order to allow you to follow its progress. These messages can be supressed through R configuration or shell redirection.

### Example of Run
```
~/R/Get and Cleaning Data/Course Project$ Rscript run_analysis.R
2015-10-21 21:32:15 Script started! timezone = America/Santiago
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 MB)
==================================================
downloaded 59.7 MB

2015-10-21 21:32:33 Unzipping dataset file ./UCI HAR Dataset.zip
2015-10-21 21:32:38 Read 2947 observations! ./UCI HAR Dataset/test/X_test.txt
2015-10-21 21:32:44 Read 7352 observations! ./UCI HAR Dataset/train/X_train.txt
2015-10-21 21:32:44 Merged 10299 observations! (#1 completed)
2015-10-21 21:32:44 Read 561 features! ./UCI HAR Dataset/features.txt
2015-10-21 21:32:44 Only 48 features required!
2015-10-21 21:32:44 10299 observations of 48 features! (#2 completed)
2015-10-21 21:32:44 Read 6 activity labels! ./UCI HAR Dataset/activity_labels.txt
2015-10-21 21:32:44 Read 2947 activity observations! ./UCI HAR Dataset/test/y_test.txt
2015-10-21 21:32:44 Read 7352 activity observations! ./UCI HAR Dataset/train/y_train.txt
2015-10-21 21:32:44 Merged 10299 activity observations!
2015-10-21 21:32:44 Added descriptive activity into dataset! (#3 completed)
2015-10-21 21:32:44 Set descriptive feature names! (#4 completed)
2015-10-21 21:32:45 Generated output! ./run_analysis_20151021_213215_4.csv
2015-10-21 21:32:45 Read 2947 subject observations! ./UCI HAR Dataset/test/subject_test.txt
2015-10-21 21:32:45 Read 7352 subject observations! ./UCI HAR Dataset/train/subject_train.txt
2015-10-21 21:32:45 Merged 10299 subject observations!
2015-10-21 21:32:45 Added subject into dataset!
2015-10-21 21:32:47 Tidy 8 variables and 494352 observations generated!
2015-10-21 21:32:48 Generated output! ./run_analysis_20151021_213215_5.csv
2015-10-21 21:32:48 Summary of tidy dataset of 8 variables and 8640 observations generated!
2015-10-21 21:32:48 Generated output! (#5 completed) ./run_analysis_20151021_213215.txt
2015-10-21 21:32:48 Script finished!
~/R/Get and Cleaning Data/Course Project$
```

## Processing
The script will :

*  Download the UCI HAR dataset zip file, in case it does not exist on the current working directory;
*  Unzip it (a directory will be created); and
*  Process its files according to the following requirements :

  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.  Uses descriptive activity names to name the activities in the data set.
  4.  Appropriately labels the data set with descriptive variable names. 
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Results
Three files, per run, will be generated in the current working directory :

1.    ```run_analysis_<YYYYMMDD>_<HHMISS>_4.csv```  
  This CSV file contains data resulting from requirements 1 to 4. Data is messy and not summarized.
2.    ```run_analysis_<YYYYMMDD>_<HHMISS>_5.csv```  
  This CSV file contains intermediate data resulting from requirement 5. Data is tidy but not summarized.
3.    ```run_analysis_<YYYYMMDD>_<HHMISS>.txt```  
  This white-space separated text file contains data resulting from requirement 5. Data is tidy and summarized. This file is the final outcome of the script as per project requirement.

**YYYYMMDD** and **HHMISS** correspond to the date and time (24hs) of when the script started its execution.

For information about the structure and content of these files, please refer to the code book.

### Download Date
File ```run_analysis.RData``` is generated whenever the script downloads the dataset zip file. It includes variable ```dataset.download```.

---
&copy; [feamcor](https://github.com/feamcor)
