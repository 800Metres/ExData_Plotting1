plot3 <- function(){
  ##load and filter the data
  mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE,sep=";")
  mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M") 
  mydata[,1] <- as.Date(mydata[,1], format="%d/%m/%Y")
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02") 
  firstFilter <- mydata[with(mydata, (mydata$Date  >= DATE1 )),]
  secondFilter <- firstFilter[with(firstFilter, (firstFilter$Date  <= DATE2 )),]

  #create the file
  png("plot3.png",height = 480, width = 480)
  #plot the graph, adding the config for the 3 lines
  plot(o$DateTime, o$Sub_metering_1,type='l',ylab="Energy sub metering", xlab="")
  lines(o$DateTime,o$Sub_metering_2,col="red")
  lines(o$DateTime,o$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=NA,lwd=2)
  dev.off()
}
