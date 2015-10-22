# Code Book ```run_analysis.R```

> For more information about installing and running ```run_analysis.R```, click [here](https://github.com/feamcor/GetAndCleaningData/blob/master/README.md).

**Human Activity Recognition** (HAR) database was built from the recordings of 30 subjects performing **Activities of Daily Living** (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The files described in this code book resulted from manipulations done on top of the UCI HAR dataset by the ```run_analysis.R``` script.

> For more information about the UCI HAR research, click [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

> For more information about the UCI HAR dataset, click [here](https://raw.githubusercontent.com/feamcor/GetAndCleaningData/master/UCI%20HAR%20Dataset%20README.txt).

## File ```run_analysis_<YYYYMMDD>.txt```

### Characteristics

* File Type : text
* Delimiter : white-space separated
* Header : yes
* Quoted Strings : yes
* Data Style : tidy data, summarized

### Dataset

Variable / Column   | Domain | Description
------------------- | ------ | -----------
activity            | string, <br/> factor | Activity performed by the subject: <br/>- WALKING<br/>- WALKING_UPSTAIRS<br/>- WALKING_DOWNSTAIRS<br/>- SITTING<br/>- STANDING<br/>- LAYING
subject             | integer, <br/> 1:30  | Subject identification
device              | string, <br/> factor | Instrument of the device from where the signals were obtained: <br/>- acc (Accelerometer)<br/>- gyr (Gyroscope)
domain              | string, <br/> factor | Domain on which signals were obtained: <br/>- time (Time)<br/>- freq (Frequency)
source              | string, <br/> factor | Source from where acceleration signal was collected: <br/>- body (Body)<br/>- grav (Gravity)<br/>- jerk (Body Jerk)
axis                | string, <br/> factor | From which axis corresponds the signal obtained from the device's instrument: <br/>- x<br/>- y<br/>- z
type                | string, <br/> factor | Type of value described in the Signal variable: <br/>- mean (Average)<br/>- std (Standard Deviation)
avg_signal          | double, <br/> -1:1   | Average of the signals obtained when grouped by each of the variables above

## File ```run_analysis_<YYYYMMDD>_5.csv```

### Characteristics

* File Type : text
* Delimiter : comma separated (.CSV)
* Header : yes
* Quoted Strings : yes
* Data Style : tidy data

### Dataset

 Variable / Column  | Domain | Description
 ------------------ | ------ | -----------
activity            | string, <br/> factor | Activity performed by the subject: <br/>- WALKING<br/>- WALKING_UPSTAIRS<br/>- WALKING_DOWNSTAIRS<br/>- SITTING<br/>- STANDING<br/>- LAYING
subject             | integer, <br/> 1:30  | Subject identification
signal              | double, <br/> -1:1   | Average or standard deviation signal obtained from device's instrument
device              | string, <br/> factor | Instrument of the device from where the signals were obtained: <br/>- acc (Accelerometer)<br/>- gyr (Gyroscope)
domain              | string, <br/> factor | Domain on which signals were obtained: <br/>- time (Time)<br/>- freq (Frequency)
source              | string, <br/> factor | Source from where acceleration signal was collected: <br/>- body (Body)<br/>- grav (Gravity)<br/>- jerk (Body Jerk)
axis                | string, <br/> factor | From which axis corresponds the signal obtained from the device's instrument: <br/>- x<br/>- y<br/>- z
type                | string, <br/> factor | Type of value described in the Signal variable: <br/>- mean (Average)<br/>- std (Standard Deviation)

## File ```run_analysis_<YYYYMMDD>_4.csv```

### Characteristics

* File Type : text
* Delimiter : comma separated (.CSV)
* Header : yes
* Quoted Strings : yes
* Data Style : messy data; column headers are values, not variables

### Dataset

 Variable / Column   | Domain | Description
 ------------------- | ------ | -----------
acc_time_body_x_mean | double, <br/> -1:1 | Axis X, raw time-domain body acceleration signal (average), obtained from accelerometer
acc_time_body_y_mean | double | Same as above but for axis Y
acc_time_body_z_mean | double | Same as above but for axis Z
acc_time_body_x_std  | double | Same as above but for axis X and signal standard deviation
acc_time_body_y_std  | double | Same as above but for axis Y
acc_time_body_z_std  | double | Same as above but for axis Z
acc_time_grav_x_mean | double | Axis X, raw time-domain gravity acceleration signal (average), obtained from accelerometer
acc_time_grav_y_mean | double | Same as above for axis Y
acc_time_grav_z_mean | double | Same as above for axis Z
acc_time_grav_x_std  | double | Same as above but for axis X and signal standard deviation
acc_time_grav_y_std  | double | Same as above for axis Y
acc_time_grav_z_std  | double | Same as above for axis Z
acc_time_jerk_x_mean | double | Axis X, raw time-domain body jerk acceleration signal (average), obtained from accelerometer
acc_time_jerk_y_mean | double | Same as above for axis Y
acc_time_jerk_z_mean | double | Same as above for axis Z
acc_time_jerk_x_std  | double | Same as above but for axis X and signal standard deviation
acc_time_jerk_y_std  | double | Same as above for axis Y
acc_time_jerk_z_std  | double | Same as above for axis Z
gyr_time_body_x_mean | double | Axis X, raw time-domain body acceleration signal (average), obtained from gyroscope
gyr_time_body_y_mean | double | Same as above for axis Y
gyr_time_body_z_mean | double | Same as above for axis Z
gyr_time_body_x_std  | double | Same as above but for axis X and signal standard deviation
gyr_time_body_y_std  | double | Same as above for axis Y
gyr_time_body_z_std  | double | Same as above for axis Z
gyr_time_jerk_x_mean | double | Axis X, raw time-domain body jerk acceleration signal (average), obtained from gyroscope
gyr_time_jerk_y_mean | double | Same as above for axis Y
gyr_time_jerk_z_mean | double | Same as above for axis Z
gyr_time_jerk_x_std  | double | Same as above but for axis X and signal standard deviation
gyr_time_jerk_y_std  | double | Same as above for axis Y
gyr_time_jerk_z_std  | double | Same as above for axis Z
acc_freq_body_x_mean | double | Axis X, raw frequency-domain body acceleration signal (average), obtained from accelerometer
acc_freq_body_y_mean | double | Same as above for axis Y
acc_freq_body_z_mean | double | Same as above for axis Z
acc_freq_body_x_std  | double | Same as above but for axis X and signal standard deviation
acc_freq_body_y_std  | double | Same as above for axis Y
acc_freq_body_z_std  | double | Same as above for axis Z
acc_freq_jerk_x_mean | double | Axis X, raw frequency-domain body jerk acceleration signal (average), obtained from accelerometer
acc_freq_jerk_y_mean | double | Same as above for axis Y
acc_freq_jerk_z_mean | double | Same as above for axis Z
acc_freq_jerk_x_std  | double | Same as above but for axis X and signal standard deviation
acc_freq_jerk_y_std  | double | Same as above for axis Y
acc_freq_jerk_z_std  | double | Same as above for axis Z
gyr_freq_body_x_mean | double | Axis X, raw frequency-domain body acceleration signal (average), obtained from gyroscope
gyr_freq_body_y_mean | double | Same as above for axis Y
gyr_freq_body_z_mean | double | Same as above for axis Z
gyr_freq_body_x_std  | double | Same as above but for axis X and signal standard deviation
gyr_freq_body_y_std  | double | Same as above for axis Y
gyr_freq_body_z_std  | double | Same as above for axis Z
activity             | string, <br/> factor |  Activity performed by the subject: <br/>- WALKING<br/>- WALKING_UPSTAIRS<br/>- WALKING_DOWNSTAIRS<br/>- SITTING<br/>- STANDING<br/>- LAYING

---
By [feamcor](https://github.com/feamcor).
