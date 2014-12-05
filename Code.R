################################################################################################
## extractData()
################################################################################################
## Function extracts the required data from the household_power_consumption.txt file, which is
## presumed to have been unzipped and present in the working directory. 
## If the OS is of *nix flavour an efficient system call using head {first (presumably header) line}
## then grep is used. Any other OS will use function calls to read the entire data set and extract   
## the required rows - MUCH slower with danger of memory overflow 
################################################################################################
extractData<-function(dataFile = "household_power_consumption.txt", outPutFile = "reqData.txt",regX = "'^(1|2)/2/2007'"){
# get the operating system type
  OSis<-.Platform$OS.type
# if *nix type, use system calls to head and grep to construct required dataset
    if(OSis == "unix"){
        command1<-paste("head -1",dataFile,">",outPutFile)
        command2<-paste("grep -E ",regX,dataFile,">>",outPutFile)
        system(command1)
        system(command2) 
    }else{
# Other OS read the entire data set      
      houseData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# search for the two dates; create logical vector identifying conformant rows 
      rightDate1<-(houseData$Date=="1/2/2007")
      rightDate2<-(houseData$Date=="2/2/2007")
      rightDate<-as.logical(rightDate1+rightDate2)
# use logical vector to extract rows 
      req<-houseData[rightDate,]
      print(head(req))
# write the required data to a file
      write.table(req,outPutFile,sep=";",row.names=F)
    }   
}

################################################################################################
## cols2posix()
################################################################################################
## converts the  Date and Time data present in columns 1 and 2 into a single posix conformant 
## date object, replaces columns 1 and 2 with a single "TimePt" column
################################################################################################
cols2posix<-function(){
# read in the date filtered data  
  rD<-read.table('reqData.txt',header=TRUE,sep=";",na.strings="?")
# concatenate the Date and Time entries and convert to  POSIX1t/POSIXct objects 
  z <- strptime(as.character(paste(rD[,1],rD[,2])), "%d/%m/%Y %H:%M:%OS")
# remove the Date Time columns from dataframe
  rD<-rD[,-(1:2)]
print(dim(rD))
# get column names and prepend the label TimePt
  cols<-colnames(rD)
  cols<-c("TimePt",cols)
  print(cols)
# bind the vector of POSIX1t/POSIXct objects to left hand column
  rD<-cbind(z,rD)
#revise the column names
  colnames(rD)<-cols
#return revised dataframe
  rD 
}


################################################################################################
## createReqData()
################################################################################################
## If the reqData object (data frame containining posix conformant timepoints and the required 
## date range) is not present the function will create it
################################################################################################
createReqData<-function(){
  if(!exists("reqData")){{
    if(file.exists('reqData.txt')){}else{ 
      extractData() }
    reqData<-read.table('reqData.txt',header=TRUE,sep=";",na.strings="?")}
    reqData<-cols2posix() }
    reqData
}