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

## Plot 4

par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with ( required.data, { plot(Global_active_power~Datetime, type = "l", ylab ="Global Active Power (kilowatts)", xlab="")
                        plot(Voltage~Datetime, type="l", ylab = "Voltage(volt)", xlab="")
                        plot(Sub_metering_1~Datetime, type="l", ylab = "Energy sub metering", xlab="")
                        lines(Sub_metering_2~Datetime, col = "red")
                        lines(Sub_metering_3~Datetime, col = "blue")
                        legend("topright", col = c("black","red","blue"), lty=1, lwd=2, bty="n", legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), xjust = 1)
                        plot(Global_reactive_power~Datetime, type="l", ylab = "Global Reactive Power (kilowatts)", xlab="")
                      }
     )
## Saving to file
 dev.copy(png, file="plot4.png", height=480, width=480) 
 dev.off() 
