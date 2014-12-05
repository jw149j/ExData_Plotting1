source("Code.R")
################################################################################################
## Every time a script is run in this application it will source this script to ensure an 
## appropriate data frame exists containing the specific information required in the formats
## required. If the dataframe is not present, then it is constructed from the original data
## file
################################################################################################

if(!exists("reqData")){
{
  if(file.exists('reqData.txt')){}else{ 
    extractData() 
  }}
#     reqData<-read.table('reqData.txt',header=TRUE,sep=";",na.strings="?")}
reqData<-cols2posix() 
}
reqData
