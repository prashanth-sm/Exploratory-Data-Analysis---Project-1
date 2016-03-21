# Exploratory-Data-Analysis---Project-1
This is the repository for Coursera's Course on Exploratory Data Analysis - Project 1

Each plot is code into individual R files and corresponding PNG files are uploaded to the repository.

Following is the code logic for the plots


1. Program checks if a folder "data" exists or not. if not, it will create a folder "data"
2. A temp file is opened and required file from the link:
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
3. The list of files in the zip is first listed. Output can be seen in the console
4. The rquired file:"household_power_consumption.txt" is extracted and stored in folder "data"
5. All the data from the " household_power_consumption.txt" is loaded in R studio as csv and stored in variable "full.data"
6. Date is converted to the desired format and stored in the date column
7. A subset is created with date between 2007-2-1 and  2007-2-2 and stored in variable "required.data"
8. Date and time is pasted into single variable "datetime" and this variable is stored in the "required.data" as "Datetime" Column

9. As per the plot requirement in each plot, logic and code is formed. refer individual code for details

10. Graphic is copied in PNG format
11. Graphic device is closed.
