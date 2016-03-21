  if(!file.exists("data")){
    dir.create("data")
  }
  
  # downloading all the files into my computer 
  temp <- tempfile() 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp) 
  unzip(temp, list = TRUE) #This provides the list of variables and I choose the ones that are applicable for this data set
  unzip(temp, files = "household_power_consumption.txt", exdir = "data")
  full.data <- read.csv("data/household_power_consumption.txt",header = T, sep = ";", stringsAsFactors = FALSE, na.strings = "?", check.names = F, comment.char = "", quote = '\"')
  unlink(temp) 

full.data$Date <- as.Date(full.data$Date, format="%d/%m/%Y")

## Subsetting the data
required.data <- subset(full.data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full.data)


## Converting dates
datetime <- paste(as.Date(required.data$Date), required.data$Time)
required.data$Datetime <- as.POSIXct(datetime)

## Plot 2 
 plot(required.data$Global_active_power~required.data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
 


## Saving to file
 dev.copy(png, file="plot2.png", height=480, width=480) 
 dev.off() 
