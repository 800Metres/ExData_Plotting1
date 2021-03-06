plot1 <- function(){
  ##load and filter the data
  mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE,sep=";")
  mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M") 
  mydata[,1] <- as.Date(mydata[,1], format="%d/%m/%Y")
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02") 
  firstFilter <- mydata[with(mydata, (mydata$Date  >= DATE1 )),]
  secondFilter <- firstFilter[with(firstFilter, (firstFilter$Date  <= DATE2 )),]
  
  #create the file, add the plot and then close
  png(filename = "plot1.png", width = 480, height=480)
  hist(as.numeric(secondFilter$Global_active_power),xlab = "Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power",col='RED')
  dev.off()
}
