# Code Book



# Raw Data Sets

The original data is made of several files, all located in the folder `UCI HAR Dataset`. The below 
files were imported into R and used for this project:

- "features.txt": List of all 561 features.
- "activity_labels.txt": Links the class labels with their activity name (6 activities).
- "train/X_train.txt": Training set, containing 7532 observations of 561 variables.
- "train/y_train.txt": Training labels.
- "test/X_test.txt": Test set, containing 2947 observations of 561 variables.
- "test/y_test.txt": Test labels.
- "train/subject_train.txt": Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- "test/subject_ttest.txt": Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Details about the Original Data

Below information is from the README.txt file and features_info.txt file included in the folder containing the original data.


Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each
person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating
variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean


# Loading and Transforming the Data

Below are the detailed steps for loading and transforming the datasets documented.

## 1) Merge Training and Test Sets

Prior to loading the data, the `dplyr` package was loaded for data processing (not shown in this report). 



Loading the meta data is straight forward with the `read.table()` function.


```r
setwd("~/GitHub/Data_Cleaning_Project/UCI HAR Dataset")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")
```

A quicklook at the data sets reveals dimensions and content.


```r
str(features)
```

```
## 'data.frame':	561 obs. of  2 variables:
##  $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...
```

```r
activities
```

```
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING
```

As the text files do not contain headers, the feature names can be extracted and used during importing the training and test set.


```r
# Extract variable names
col_names <- as.character(features$V2)
head(col_names)
```

```
## [1] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"
## [4] "tBodyAcc-std()-X"  "tBodyAcc-std()-Y"  "tBodyAcc-std()-Z"
```

Now, training and test sets are loaded into R. Afterwards, they are merged together and a label column as well as a subject column are added from the respective files and data sets.


```r
# Load Training Set
setwd("~/GitHub/Data_Cleaning_Project/UCI HAR Dataset/train")
X_train <- read.table("X_train.txt", col.names = col_names)
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

# Load Test Set
setwd("~/GitHub/Data_Cleaning_Project/UCI HAR Dataset/test")
X_test <- read.table("X_test.txt", col.names = col_names)
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# Merge with rbind()
X.raw <- rbind(X_train, X_test)  # merge observation sets
y.raw <- rbind(y_train, y_test)  # merge label sets
subject.raw <- rbind(subject_train, subject_test)  # merge subject sets

# Add Label to merged data set
x.labelled <- X.raw
x.labelled$activity <- y.raw$V1  # Add label column called "activity"
x.labelled$subject <- subject.raw$V1  # Add subject column called "subject"
dim(x.labelled)  # print data set dimensions
```

```
## [1] 10299   563
```

## 2) Extract Mean and Standard Deviation from Measurements

The merged dataset contains 563 variables; however, only the mean and standard deviation measurements are required. By using regular expressions, only these as well as the label and subject column are kept and saved into a new data set.


```r
filtered.cols <- grep("mean\\.|std\\.|^activity|^subject", names(x.labelled))
x <- x.labelled[, filtered.cols]
dim(x)
```

```
## [1] 10299    68
```


## 3) Descriptive Activity Labels

The activity descriptions contained in the `activities` data set are used to change the values of the label column to descriptions.


```r
# Convert from factor to character
activities$V2 <- as.character(activities$V2)

# Loop through each activity
for (i in 1:nrow(activities)) {
      # Re-assign new value: instead of a number the respective activity as described.
      x$activity[x$activity == i] <- activities$V2[activities$V1 == i]
}

# Print a few rows of the last columns of x
head(x[, 65:68])
```

```
##   fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag.std.. activity subject
## 1                  -0.9919904                 -0.9906975 STANDING       1
## 2                  -0.9958539                 -0.9963995 STANDING       1
## 3                  -0.9950305                 -0.9951274 STANDING       1
## 4                  -0.9952207                 -0.9952369 STANDING       1
## 5                  -0.9950928                 -0.9954648 STANDING       1
## 6                  -0.9951433                 -0.9952387 STANDING       1
```

```r
# Print unique values of activity column
unique(x$activity)
```

```
## [1] "STANDING"           "SITTING"            "LAYING"            
## [4] "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"
```

## 4) Label the Data Set

Because the column names were extracted already in Step (1), the variables are already labelled. However, the variable names are cleaned up by removing the periods in the names.


```r
# Show first 10 names
head(names(x), 10)
```

```
##  [1] "tBodyAcc.mean...X"    "tBodyAcc.mean...Y"    "tBodyAcc.mean...Z"   
##  [4] "tBodyAcc.std...X"     "tBodyAcc.std...Y"     "tBodyAcc.std...Z"    
##  [7] "tGravityAcc.mean...X" "tGravityAcc.mean...Y" "tGravityAcc.mean...Z"
## [10] "tGravityAcc.std...X"
```

```r
# Remove periods/dots
new_names <- gsub("\\.", "", names(x))
names(x) <- new_names

# Show new names (first 10)
head(names(x), 10)
```

```
##  [1] "tBodyAccmeanX"    "tBodyAccmeanY"    "tBodyAccmeanZ"   
##  [4] "tBodyAccstdX"     "tBodyAccstdY"     "tBodyAccstdZ"    
##  [7] "tGravityAccmeanX" "tGravityAccmeanY" "tGravityAccmeanZ"
## [10] "tGravityAccstdX"
```

## 5) Create Summary Data Set

A summary data set, containing the mean values of all variables for each activity and subject is created as below.


```r
# Use the dplyr package to create summary data set
x <- tbl_df(x)
x2 <- x %>% 
      group_by(activity, subject) %>% 
      summarise_each(funs(sum), -c(activity, subject))
# Dimensions
dim(x2)
```

```
## [1] 180  68
```

```r
x2
```

```
## Source: local data frame [180 x 68]
## Groups: activity [?]
## 
##    activity subject tBodyAccmeanX tBodyAccmeanY tBodyAccmeanZ tBodyAccstdX
##       (chr)   (int)         (dbl)         (dbl)         (dbl)        (dbl)
## 1    LAYING       1      11.07991    -2.0256977     -5.660178    -46.40282
## 2    LAYING       2      13.50592    -0.8716195     -5.147789    -46.75485
## 3    LAYING       3      17.08204    -1.1752521     -6.280630    -60.93215
## 4    LAYING       4      14.23220    -0.8101719     -5.977160    -51.52646
## 5    LAYING       5      14.47338    -0.9518190     -5.612755    -50.22859
## 6    LAYING       6      14.17342    -0.5844163     -7.587816    -53.24082
## 7    LAYING       7      13.00919    -1.0629399     -5.270774    -48.69871
## 8    LAYING       8      14.10773    -1.1463214     -5.521250    -50.92423
## 9    LAYING       9      12.95978    -1.0263411     -5.377486    -47.11665
## 10   LAYING      10      16.25337    -1.4090801     -6.795781    -56.16045
## ..      ...     ...           ...           ...           ...          ...
## Variables not shown: tBodyAccstdY (dbl), tBodyAccstdZ (dbl),
##   tGravityAccmeanX (dbl), tGravityAccmeanY (dbl), tGravityAccmeanZ (dbl),
##   tGravityAccstdX (dbl), tGravityAccstdY (dbl), tGravityAccstdZ (dbl),
##   tBodyAccJerkmeanX (dbl), tBodyAccJerkmeanY (dbl), tBodyAccJerkmeanZ
##   (dbl), tBodyAccJerkstdX (dbl), tBodyAccJerkstdY (dbl), tBodyAccJerkstdZ
##   (dbl), tBodyGyromeanX (dbl), tBodyGyromeanY (dbl), tBodyGyromeanZ (dbl),
##   tBodyGyrostdX (dbl), tBodyGyrostdY (dbl), tBodyGyrostdZ (dbl),
##   tBodyGyroJerkmeanX (dbl), tBodyGyroJerkmeanY (dbl), tBodyGyroJerkmeanZ
##   (dbl), tBodyGyroJerkstdX (dbl), tBodyGyroJerkstdY (dbl),
##   tBodyGyroJerkstdZ (dbl), tBodyAccMagmean (dbl), tBodyAccMagstd (dbl),
##   tGravityAccMagmean (dbl), tGravityAccMagstd (dbl), tBodyAccJerkMagmean
##   (dbl), tBodyAccJerkMagstd (dbl), tBodyGyroMagmean (dbl), tBodyGyroMagstd
##   (dbl), tBodyGyroJerkMagmean (dbl), tBodyGyroJerkMagstd (dbl),
##   fBodyAccmeanX (dbl), fBodyAccmeanY (dbl), fBodyAccmeanZ (dbl),
##   fBodyAccstdX (dbl), fBodyAccstdY (dbl), fBodyAccstdZ (dbl),
##   fBodyAccJerkmeanX (dbl), fBodyAccJerkmeanY (dbl), fBodyAccJerkmeanZ
##   (dbl), fBodyAccJerkstdX (dbl), fBodyAccJerkstdY (dbl), fBodyAccJerkstdZ
##   (dbl), fBodyGyromeanX (dbl), fBodyGyromeanY (dbl), fBodyGyromeanZ (dbl),
##   fBodyGyrostdX (dbl), fBodyGyrostdY (dbl), fBodyGyrostdZ (dbl),
##   fBodyAccMagmean (dbl), fBodyAccMagstd (dbl), fBodyBodyAccJerkMagmean
##   (dbl), fBodyBodyAccJerkMagstd (dbl), fBodyBodyGyroMagmean (dbl),
##   fBodyBodyGyroMagstd (dbl), fBodyBodyGyroJerkMagmean (dbl),
##   fBodyBodyGyroJerkMagstd (dbl)
```

The summary data set contains 180 rows, resulting from each possible combination of 6 activities and 30 subjects.

Finally, the data sets are saved to CSV files.


```r
setwd("~/GitHub/Data_Cleaning_Project")
write.csv(x, "x.csv")
write.csv(x2, "x2.csv")
```

# Variables

## Variables of the Cleaned Data

The variables of the cleaned data set, `x`, are the same as of the original data set, but filtered so that only Mean and Standard Deviation variants are included.

Summary of variables:

- Mean values: 33 variables
- Standard Deviation values: 33 variables
- Others: 2 variables

Variables for mean values:


```r
grep("mean", names(x), value = TRUE)
```

```
##  [1] "tBodyAccmeanX"            "tBodyAccmeanY"           
##  [3] "tBodyAccmeanZ"            "tGravityAccmeanX"        
##  [5] "tGravityAccmeanY"         "tGravityAccmeanZ"        
##  [7] "tBodyAccJerkmeanX"        "tBodyAccJerkmeanY"       
##  [9] "tBodyAccJerkmeanZ"        "tBodyGyromeanX"          
## [11] "tBodyGyromeanY"           "tBodyGyromeanZ"          
## [13] "tBodyGyroJerkmeanX"       "tBodyGyroJerkmeanY"      
## [15] "tBodyGyroJerkmeanZ"       "tBodyAccMagmean"         
## [17] "tGravityAccMagmean"       "tBodyAccJerkMagmean"     
## [19] "tBodyGyroMagmean"         "tBodyGyroJerkMagmean"    
## [21] "fBodyAccmeanX"            "fBodyAccmeanY"           
## [23] "fBodyAccmeanZ"            "fBodyAccJerkmeanX"       
## [25] "fBodyAccJerkmeanY"        "fBodyAccJerkmeanZ"       
## [27] "fBodyGyromeanX"           "fBodyGyromeanY"          
## [29] "fBodyGyromeanZ"           "fBodyAccMagmean"         
## [31] "fBodyBodyAccJerkMagmean"  "fBodyBodyGyroMagmean"    
## [33] "fBodyBodyGyroJerkMagmean"
```

Variables for standard deviation values:


```r
grep("std", names(x), value = TRUE)
```

```
##  [1] "tBodyAccstdX"            "tBodyAccstdY"           
##  [3] "tBodyAccstdZ"            "tGravityAccstdX"        
##  [5] "tGravityAccstdY"         "tGravityAccstdZ"        
##  [7] "tBodyAccJerkstdX"        "tBodyAccJerkstdY"       
##  [9] "tBodyAccJerkstdZ"        "tBodyGyrostdX"          
## [11] "tBodyGyrostdY"           "tBodyGyrostdZ"          
## [13] "tBodyGyroJerkstdX"       "tBodyGyroJerkstdY"      
## [15] "tBodyGyroJerkstdZ"       "tBodyAccMagstd"         
## [17] "tGravityAccMagstd"       "tBodyAccJerkMagstd"     
## [19] "tBodyGyroMagstd"         "tBodyGyroJerkMagstd"    
## [21] "fBodyAccstdX"            "fBodyAccstdY"           
## [23] "fBodyAccstdZ"            "fBodyAccJerkstdX"       
## [25] "fBodyAccJerkstdY"        "fBodyAccJerkstdZ"       
## [27] "fBodyGyrostdX"           "fBodyGyrostdY"          
## [29] "fBodyGyrostdZ"           "fBodyAccMagstd"         
## [31] "fBodyBodyAccJerkMagstd"  "fBodyBodyGyroMagstd"    
## [33] "fBodyBodyGyroJerkMagstd"
```

Other variables: there are two additional variables, which are subject and activity label:


```r
grep("^activity|^subject", names(x), value = TRUE)
```

```
## [1] "activity" "subject"
```

Table of Variables:


```r
glimpse(x)
```

```
## Observations: 10,299
## Variables: 68
## $ tBodyAccmeanX            (dbl) 0.2885845, 0.2784188, 0.2796531, 0.27...
## $ tBodyAccmeanY            (dbl) -0.020294171, -0.016410568, -0.019467...
## $ tBodyAccmeanZ            (dbl) -0.13290514, -0.12352019, -0.11346169...
## $ tBodyAccstdX             (dbl) -0.9952786, -0.9982453, -0.9953796, -...
## $ tBodyAccstdY             (dbl) -0.9831106, -0.9753002, -0.9671870, -...
## $ tBodyAccstdZ             (dbl) -0.9135264, -0.9603220, -0.9789440, -...
## $ tGravityAccmeanX         (dbl) 0.9633961, 0.9665611, 0.9668781, 0.96...
## $ tGravityAccmeanY         (dbl) -0.1408397, -0.1415513, -0.1420098, -...
## $ tGravityAccmeanZ         (dbl) 0.115374940, 0.109378810, 0.101883920...
## $ tGravityAccstdX          (dbl) -0.9852497, -0.9974113, -0.9995740, -...
## $ tGravityAccstdY          (dbl) -0.9817084, -0.9894474, -0.9928658, -...
## $ tGravityAccstdZ          (dbl) -0.8776250, -0.9316387, -0.9929172, -...
## $ tBodyAccJerkmeanX        (dbl) 0.07799634, 0.07400671, 0.07363596, 0...
## $ tBodyAccJerkmeanY        (dbl) 0.005000803, 0.005771104, 0.003104037...
## $ tBodyAccJerkmeanZ        (dbl) -0.0678308080, 0.0293766330, -0.00904...
## $ tBodyAccJerkstdX         (dbl) -0.9935191, -0.9955481, -0.9907428, -...
## $ tBodyAccJerkstdY         (dbl) -0.9883600, -0.9810636, -0.9809556, -...
## $ tBodyAccJerkstdZ         (dbl) -0.9935750, -0.9918457, -0.9896866, -...
## $ tBodyGyromeanX           (dbl) -0.006100849, -0.016111620, -0.031698...
## $ tBodyGyromeanY           (dbl) -0.03136479, -0.08389378, -0.10233542...
## $ tBodyGyromeanZ           (dbl) 0.10772540, 0.10058429, 0.09612688, 0...
## $ tBodyGyrostdX            (dbl) -0.9853103, -0.9831200, -0.9762921, -...
## $ tBodyGyrostdY            (dbl) -0.9766234, -0.9890458, -0.9935518, -...
## $ tBodyGyrostdZ            (dbl) -0.9922053, -0.9891212, -0.9863787, -...
## $ tBodyGyroJerkmeanX       (dbl) -0.09916740, -0.11050283, -0.10848567...
## $ tBodyGyroJerkmeanY       (dbl) -0.05551737, -0.04481873, -0.04241031...
## $ tBodyGyroJerkmeanZ       (dbl) -0.061985797, -0.059242822, -0.055828...
## $ tBodyGyroJerkstdX        (dbl) -0.9921107, -0.9898726, -0.9884618, -...
## $ tBodyGyroJerkstdY        (dbl) -0.9925193, -0.9972926, -0.9956321, -...
## $ tBodyGyroJerkstdZ        (dbl) -0.9920553, -0.9938510, -0.9915318, -...
## $ tBodyAccMagmean          (dbl) -0.9594339, -0.9792892, -0.9837031, -...
## $ tBodyAccMagstd           (dbl) -0.9505515, -0.9760571, -0.9880196, -...
## $ tGravityAccMagmean       (dbl) -0.9594339, -0.9792892, -0.9837031, -...
## $ tGravityAccMagstd        (dbl) -0.9505515, -0.9760571, -0.9880196, -...
## $ tBodyAccJerkMagmean      (dbl) -0.9933059, -0.9912535, -0.9885313, -...
## $ tBodyAccJerkMagstd       (dbl) -0.9943364, -0.9916944, -0.9903969, -...
## $ tBodyGyroMagmean         (dbl) -0.9689591, -0.9806831, -0.9763171, -...
## $ tBodyGyroMagstd          (dbl) -0.9643352, -0.9837542, -0.9860515, -...
## $ tBodyGyroJerkMagmean     (dbl) -0.9942478, -0.9951232, -0.9934032, -...
## $ tBodyGyroJerkMagstd      (dbl) -0.9913676, -0.9961016, -0.9950910, -...
## $ fBodyAccmeanX            (dbl) -0.9947832, -0.9974507, -0.9935941, -...
## $ fBodyAccmeanY            (dbl) -0.9829841, -0.9768517, -0.9725115, -...
## $ fBodyAccmeanZ            (dbl) -0.9392687, -0.9735227, -0.9833040, -...
## $ fBodyAccstdX             (dbl) -0.9954217, -0.9986803, -0.9963128, -...
## $ fBodyAccstdY             (dbl) -0.9831330, -0.9749298, -0.9655059, -...
## $ fBodyAccstdZ             (dbl) -0.9061650, -0.9554381, -0.9770493, -...
## $ fBodyAccJerkmeanX        (dbl) -0.9923325, -0.9950322, -0.9909937, -...
## $ fBodyAccJerkmeanY        (dbl) -0.9871699, -0.9813115, -0.9816423, -...
## $ fBodyAccJerkmeanZ        (dbl) -0.9896961, -0.9897398, -0.9875663, -...
## $ fBodyAccJerkstdX         (dbl) -0.9958207, -0.9966523, -0.9912488, -...
## $ fBodyAccJerkstdY         (dbl) -0.9909363, -0.9820839, -0.9814148, -...
## $ fBodyAccJerkstdZ         (dbl) -0.9970517, -0.9926268, -0.9904159, -...
## $ fBodyGyromeanX           (dbl) -0.9865744, -0.9773867, -0.9754332, -...
## $ fBodyGyromeanY           (dbl) -0.9817615, -0.9925300, -0.9937147, -...
## $ fBodyGyromeanZ           (dbl) -0.9895148, -0.9896058, -0.9867557, -...
## $ fBodyGyrostdX            (dbl) -0.9850326, -0.9849043, -0.9766422, -...
## $ fBodyGyrostdY            (dbl) -0.9738861, -0.9871681, -0.9933990, -...
## $ fBodyGyrostdZ            (dbl) -0.9940349, -0.9897847, -0.9873282, -...
## $ fBodyAccMagmean          (dbl) -0.9521547, -0.9808566, -0.9877948, -...
## $ fBodyAccMagstd           (dbl) -0.9561340, -0.9758658, -0.9890155, -...
## $ fBodyBodyAccJerkMagmean  (dbl) -0.9937257, -0.9903355, -0.9892801, -...
## $ fBodyBodyAccJerkMagstd   (dbl) -0.9937550, -0.9919603, -0.9908667, -...
## $ fBodyBodyGyroMagmean     (dbl) -0.9801349, -0.9882956, -0.9892548, -...
## $ fBodyBodyGyroMagstd      (dbl) -0.9613094, -0.9833219, -0.9860277, -...
## $ fBodyBodyGyroJerkMagmean (dbl) -0.9919904, -0.9958539, -0.9950305, -...
## $ fBodyBodyGyroJerkMagstd  (dbl) -0.9906975, -0.9963995, -0.9951274, -...
## $ activity                 (chr) "STANDING", "STANDING", "STANDING", "...
## $ subject                  (int) 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
```


## Variables of the Summarized Data

The summarized data, `x2`, contains the same variables as `x`, i.e. 68 variables in total. However, it has only 180 observations, containing the grouped mean values of each variable.


```r
glimpse(x2)
```

```
## Observations: 180
## Variables: 68
## $ activity                 (chr) "LAYING", "LAYING", "LAYING", "LAYING...
## $ subject                  (int) 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12...
## $ tBodyAccmeanX            (dbl) 11.07991, 13.50592, 17.08204, 14.2322...
## $ tBodyAccmeanY            (dbl) -2.0256977, -0.8716195, -1.1752521, -...
## $ tBodyAccmeanZ            (dbl) -5.660178, -5.147789, -6.280630, -5.9...
## $ tBodyAccstdX             (dbl) -46.40282, -46.75485, -60.93215, -51....
## $ tBodyAccstdY             (dbl) -41.84137, -47.05332, -59.64757, -50....
## $ tBodyAccstdZ             (dbl) -41.30307, -47.24320, -59.74884, -51....
## $ tGravityAccmeanX         (dbl) -12.444090, -24.468203, -14.989026, -...
## $ tGravityAccmeanY         (dbl) 35.277489, 36.121759, 51.895990, 49.4...
## $ tGravityAccmeanZ         (dbl) 22.290886, 31.048074, 30.299597, 18.4...
## $ tGravityAccstdX          (dbl) -44.84150, -46.03269, -60.91576, -49....
## $ tGravityAccstdY          (dbl) -45.38600, -47.43417, -60.83457, -52....
## $ tGravityAccstdZ          (dbl) -42.61831, -47.24306, -59.81807, -52....
## $ tBodyAccJerkmeanX        (dbl) 4.054327, 3.964668, 4.772829, 5.04626...
## $ tBodyAccJerkmeanY        (dbl) 0.19191020, 0.58822985, 0.85585427, 0...
## $ tBodyAccJerkmeanZ        (dbl) 0.54171182, -0.08652715, -0.27008804,...
## $ tBodyAccJerkstdX         (dbl) -47.92411, -47.32186, -60.81452, -52....
## $ tBodyAccJerkstdY         (dbl) -46.20746, -47.19228, -60.06006, -50....
## $ tBodyAccJerkstdZ         (dbl) -47.74276, -47.44522, -60.88978, -52....
## $ tBodyGyromeanX           (dbl) -0.8276547, -0.8868771, -1.2906574, -...
## $ tBodyGyromeanY           (dbl) -3.224306, -5.366440, -4.454744, -5.0...
## $ tBodyGyromeanZ           (dbl) 7.434472, 6.954377, 8.555973, 9.16490...
## $ tBodyGyrostdX            (dbl) -43.67719, -47.43721, -60.42184, -52....
## $ tBodyGyrostdY            (dbl) -47.55452, -47.15000, -60.59090, -51....
## $ tBodyGyrostdZ            (dbl) -45.41423, -46.09471, -59.73735, -51....
## $ tBodyGyroJerkmeanX       (dbl) -5.363547, -4.894758, -6.202759, -5.6...
## $ tBodyGyroJerkmeanY       (dbl) -2.075864, -1.721233, -2.416585, -2.0...
## $ tBodyGyroJerkmeanZ       (dbl) -3.702506, -3.368558, -4.261500, -3.8...
## $ tBodyGyroJerkstdX        (dbl) -45.93043, -47.67532, -60.78038, -52....
## $ tBodyGyroJerkstdY        (dbl) -48.39536, -47.49924, -61.17929, -53....
## $ tBodyGyroJerkstdZ        (dbl) -47.88951, -47.42572, -60.96697, -53....
## $ tBodyAccMagmean          (dbl) -42.09646, -46.91690, -60.31306, -51....
## $ tBodyAccMagstd           (dbl) -39.75724, -46.69795, -59.78153, -50....
## $ tGravityAccMagmean       (dbl) -42.09646, -46.91690, -60.31306, -51....
## $ tGravityAccMagstd        (dbl) -39.75724, -46.69795, -59.78153, -50....
## $ tBodyAccJerkMagmean      (dbl) -47.71981, -47.41160, -60.72804, -52....
## $ tBodyAccJerkMagstd       (dbl) -46.41228, -47.30487, -60.51952, -51....
## $ tBodyGyroMagmean         (dbl) -43.73798, -45.60056, -58.99701, -50....
## $ tBodyGyroMagstd          (dbl) -40.95051, -46.13587, -59.16506, -51....
## $ tBodyGyroJerkMagmean     (dbl) -48.17305, -47.60482, -61.17624, -53....
## $ tBodyGyroJerkMagstd      (dbl) -46.79205, -47.50647, -60.95463, -53....
## $ fBodyAccmeanX            (dbl) -46.95495, -46.88280, -60.80127, -51....
## $ fBodyAccmeanY            (dbl) -43.35326, -47.03044, -59.59254, -50....
## $ fBodyAccmeanZ            (dbl) -44.13334, -47.25029, -60.03659, -52....
## $ fBodyAccstdX             (dbl) -46.22187, -46.71583, -60.98885, -51....
## $ fBodyAccstdY             (dbl) -41.68128, -47.08921, -59.77387, -51....
## $ fBodyAccstdZ             (dbl) -40.64458, -47.27002, -59.72330, -51....
## $ fBodyAccJerkmeanX        (dbl) -47.85369, -47.31905, -60.79182, -52....
## $ fBodyAccJerkmeanY        (dbl) -46.12313, -47.17288, -60.06263, -50....
## $ fBodyAccJerkmeanZ        (dbl) -47.40305, -47.33746, -60.70559, -52....
## $ fBodyAccJerkstdX         (dbl) -48.20804, -47.38801, -60.95360, -52....
## $ fBodyAccJerkstdY         (dbl) -46.61089, -47.27939, -60.20473, -50....
## $ fBodyAccJerkstdZ         (dbl) -48.02935, -47.48858, -60.99014, -52....
## $ fBodyGyromeanX           (dbl) -42.51246, -47.34869, -60.15037, -52....
## $ fBodyGyromeanY           (dbl) -47.60957, -47.19944, -60.64218, -52....
## $ fBodyGyromeanZ           (dbl) -45.46514, -46.20825, -59.66520, -51....
## $ fBodyGyrostdX            (dbl) -44.11482, -47.46531, -60.51116, -52....
## $ fBodyGyrostdY            (dbl) -47.56160, -47.13171, -60.57601, -51....
## $ fBodyGyrostdZ            (dbl) -45.82913, -46.23236, -59.96992, -52....
## $ fBodyAccMagmean          (dbl) -43.08838, -46.80529, -59.86251, -50....
## $ fBodyAccMagstd           (dbl) -39.91505, -46.80583, -60.03771, -50....
## $ fBodyBodyAccJerkMagmean  (dbl) -46.66502, -47.29796, -60.50888, -51....
## $ fBodyBodyAccJerkMagstd   (dbl) -46.09020, -47.25929, -60.46893, -51....
## $ fBodyBodyGyroMagmean     (dbl) -43.10951, -46.66142, -59.80438, -51....
## $ fBodyBodyGyroMagstd      (dbl) -41.21597, -46.13272, -59.23740, -51....
## $ fBodyBodyGyroJerkMagmean (dbl) -47.11835, -47.53194, -61.02525, -53....
## $ fBodyBodyGyroJerkMagstd  (dbl) -46.63303, -47.49565, -60.91923, -53....
```

# Summary

This concludes the project assignment. All steps should be reproducible with the data provided in the repository. The script described above is available in the R file provided, named `run_Analysis.R`. 
