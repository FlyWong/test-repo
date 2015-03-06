install.packages('xlsx')
library(xlsx)

install.packages('rJava')
library(rJava)

install.packages("XML")
library(XML)

install.packages("data.table")
library(data.table)

## testing file download functionality. 

fileUrl <-  "https://data.baltimorecity.gov/api/views/k78j-azhn/rows.csv?accessType=DOWNLOAD"

download.file(fileUrl,destfile = "cameras.csv") # you may want to put the file in a folder of your choice
list.files(".")

# test reading csv
cameraData <- read.csv("cameras.csv")

#test download excel and read.xlsx

fileUrl <-  "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,destfile = "temp.xlsx", mode="wb") # Special note: exel are binary files, need to specify mode="wb"

dat<-read.xlsx("temp.xlsx",sheetIndex=1,rowIndex=c(18:23),colIndex=c(7:15))

#test read in xml
fileUrl = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
temp = xmlTreeParse(fileUrl, useInternal=TRUE)

#test fread - for reading into data table

DT<-fread("cameras.csv")
