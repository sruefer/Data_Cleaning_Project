# Course Project - Data Science Specialization, Getting and Cleaning Data, Week 4

# Load Libraries
library(dplyr)

# Function that loads and transforms the original data and then saves the 
# resulting data into CSV files.
# Inputs: init_path (chr), default set
# Outputs: 2 CSV files, "x.csv" and "x2.csv"
run_Analysis <- function(init_path = "~/GitHub/Data_Cleaning_Project") {
      
      # 1) Merge Training and Test data sets
      
      ## Load Feature Names
      setwd(paste0(init_path, "/UCI HAR Dataset"))
      features <- read.table("features.txt")
      activities <- read.table("activity_labels.txt")
      
      col_names <- as.character(features$V2)  # Extract variable names
      head(col_names)
      
      ## Load Training Set
      setwd(paste0(init_path, "/UCI HAR Dataset/train"))
      X_train <- read.table("X_train.txt", col.names = col_names)
      y_train <- read.table("y_train.txt")
      subject_train <- read.table("subject_train.txt")
      
      ## Load Test Set
      setwd(paste0(init_path, "/UCI HAR Dataset/test"))
      X_test <- read.table("X_test.txt", col.names = col_names)
      y_test <- read.table("y_test.txt")
      subject_test <- read.table("subject_test.txt")
      
      ## Merge with rbind()
      X.raw <- rbind(X_train, X_test)  # merge observation sets
      y.raw <- rbind(y_train, y_test)  # merge label sets
      subject.raw <- rbind(subject_train, subject_test)  # merge subject sets
      
      ## Add Label to merged data set
      x.labelled <- X.raw
      x.labelled$activity <- y.raw$V1  # Add label column called "activity"
      x.labelled$subject <- subject.raw$V1
      
      # 2) Extract Mean and Standard Deviation Measurements
      filtered.cols <- grep("mean\\.|std\\.|^activity|^subject", names(x.labelled))
      x <- x.labelled[, filtered.cols]
      
      
      # 3) Write descriptive Activity Labels
      activities$V2 <- as.character(activities$V2)
      for (i in 1:nrow(activities)) {
            x$activity[x$activity == i] <- activities$V2[activities$V1 == i]
      }
      
      
      # 4) Label the data set
      head(names(x), 20)
      new_names <- gsub("\\.", "", names(x))
      names(x) <- new_names
      
      
      # 5) Summary data set
      x <- tbl_df(x)
      x2 <- x %>% 
            group_by(activity, subject) %>% 
            summarise_each(funs(sum), -c(activity, subject))

      
      # Save Files
      setwd(init_path)
      write.csv(x, "x.csv")
      write.csv(x2, "x2.csv")
      
      write.table(x2, file = "x2.txt", row.names = FALSE)
}
