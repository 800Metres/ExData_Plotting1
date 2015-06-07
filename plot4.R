plot4 <- function(){
  
  ##load and filter the data
  mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE,sep=";")
  mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M") 
  mydata[,1] <- as.Date(mydata[,1], format="%d/%m/%Y")
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02") 
  firstFilter <- mydata[with(mydata, (mydata$Date  >= DATE1 )),]
  secondFilter <- firstFilter[with(firstFilter, (firstFilter$Date  <= DATE2 )),]
  
  #create the output
  png("plot4.png",height = 485, width=485)

  #define layout
  par(mfrow = c(2,2))

  #Plot the graphs, each one appearing in the right layout sequence
  plot(secondFilter$DateTime, secondFilter$Global_active_power,type='l',ylab="Global Active Power (kilowatts)", xlab=""
  plot(secondFilter$DateTime, secondFilter$Voltage,type='l',ylab="Voltage", xlab="datetime") 
  plot(o$DateTime, o$Sub_metering_1,type='l',ylab="Energy sub metering", xlab="")
   lines(o$DateTime,o$Sub_metering_2,col="red")
   lines(o$DateTime,o$Sub_metering_3,col="blue")
   legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=NA,lwd=2)
  plot(secondFilter$DateTime, secondFilter$Global_reactive_power,type='l',ylab="Global_reactive_power", xlab="datetime")
  
  #write the file
  dev.off()
}
