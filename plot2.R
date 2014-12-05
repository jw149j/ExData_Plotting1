houseData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# search for the two dates; create logical vector identifying conformant rows 
rightDate1<-(houseData$Date=="1/2/2007")
rightDate2<-(houseData$Date=="2/2/2007")
rightDate<-as.logical(rightDate1+rightDate2)
# use logical vector to extract rows 
reqData<-houseData[rightDate,]
z <- strptime(as.character(paste(reqData[,1],reqData[,2])), "%d/%m/%Y %H:%M:%OS")
# remove the Date Time columns from dataframe
reqData<-reqData[,-(1:2)]
# get column names and prepend the label TimePt
cols<-colnames(reqData)
cols<-c("TimePt",cols)
# bind the vector of POSIX1t/POSIXct objects to left hand column
reqData<-cbind(z,reqData)
#revise the column names
colnames(reqData)<-cols
rm(houseData)
# set png graphics device with required dimensions
png("plot2.png",width = 480,height = 480,units = "px")
# create empty plotting canvas
plot(reqData[,1],reqData[,2],xlab="", ylab="Global active Power (kilowatts)", type="n")
# add line from approriate data
lines(reqData[,1],reqData[,2])
# turn off graphics device
dev.off()