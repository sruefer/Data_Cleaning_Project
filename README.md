# README.md



# Intro

This repository contains script files as well as data sets and documentation about the Data Cleaning Project. In this project, original data has been provided, which is located in the folder 'UCI HAR Dataset'. All other files were created during this project.


# Files and Scripts

The created files fall into three categories:

- CSV files: the tidy datasets, which are
  -- 'x.csv': the transformed and cleaned dataset
  -- 'x2.csv': the summarized dataset, derived from 'x.csv' through further transformations.
- R files: the script file that converts the original data into the 2 new CSV files. There is only one R file.
- others: documentation files of various formats (Rmd, md, HTML)

## run_Analysis.R Script

The R script file contains a function `run_Analysis` that was run to create both CSV files. It takes as parameter the root file path. It is assumed that the folder containing the original data is present and named 'UCI HAR Dataset'. The output files are saved in the root path.

## Code Book Files

The code book is available in multiple file formats. It explains the script, variables and data transformations in detail.




