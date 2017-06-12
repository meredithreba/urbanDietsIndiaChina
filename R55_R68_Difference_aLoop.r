#### Script for Geolocating Indian Districts
#### January 21, 2015

# remove old variables
rm(list= ls())

# install packages
install.packages('plyr', repos='http://cran.us.r-project.org')
library (plyr)

install.packages('Hmisc', repos='http://cran.us.r-project.org')
library (Hmisc)

###################################################
##AVOID OUTPUT IN SCIENTIFIC FORMAT
###################################################
options(scipen=999)
###################################################

###################################################
## SET WORKING DIRECTORY
#########################################################
setwd('//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/')

round1 = "Round 55"
round2 = "Round 68"

urban.path.1 = paste(round1, "Estimation Outputs", "UrbanTest", sep = "/")
urban.path.2 = paste(round2, "Estimation Outputs", "UrbanTest", sep = "/")

rural.path.1 = paste(round1, "Estimation Outputs", "RuralTest", sep = "/")
rural.path.2 = paste(round2, "Estimation Outputs", "RuralTest", sep = "/")

###########################################################
# list all files in folder

#Urban files
urban.files.1 = list.files(path = urban.path.1, pattern="*.csv", recursive=FALSE)
urban.files.2 = list.files(path = urban.path.2, pattern="*.csv", recursive=FALSE)

urban.commodities.1 = gsub("([^_]+)_([^_]+)_([^_]+)\\.csv$" , "\\3", urban.files.1)
urban.commodities.2 = gsub("([^_]+)_([^_]+)_([^_]+)\\.csv$" , "\\3", urban.files.2)
urban.commodities = intersect(urban.commodities.1, urban.commodities.2)

#Rural files
rural.files.1 = list.files(path = rural.path.1, pattern="*.csv", recursive=FALSE)
rural.files.2 = list.files(path = rural.path.2, pattern="*.csv", recursive=FALSE)


for (commodity in urban.commodities){
	filename.1 = paste(gsub(" ", "", round1), 'urban', commodity, sep = "_")
	filepath.1 = paste(urban.path.1,'/', filename.1, ".csv", sep = "")
	filename.2 = paste(gsub(" ", "", round2), 'urban', commodity, sep = "_")
	filepath.2 = paste(urban.path.2,'/', filename.2, ".csv", sep = "")
	
	time1 = read.csv(filepath.1, )
	time2 = read.csv(filepath.2, )
	
	
	



}




time1 = list.files(path = "//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/Round 68/Estimation Outputs/UrbanTest", pattern="*.csv", recursive=FALSE)
filesnames<-gsub("_", "", time1)
names1<-gsub(".csv","", filesnames)

time2 = list.files(path = "//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/Round 55/Estimation Outputs/UrbanTest")
filesnames<-gsub("_", "", time2)
names2<-gsub(".csv","", filesnames)

##############################################################
## i want to run through both lists of files at the same time so what do i call files?
for (i in 1:length(files)) {
# load R68 files
time1 <- read.csv(x, header=T)
# load R55 files
time2 <- read.csv(y, header=T)

# change column names R68 files
colnames(time1)[5] <- "cons_R68"
colnames(time1)[2] <- "District2"

# change column names R55 files
colnames(time1)[6] <- "cons_R55"

# concatenate lat/long
time1$unique = paste(time1$latitude, time1$longitude, sep='')
time2$unique = paste(time2$latitude, time2$longitude, sep='')

# # keeping the relevant variables from either dataset
use.vars = c("STATE_DISTRICT", "cons_R55", "STATE_GIS", "DIST_GIS", "latitude", "longitude", "latlong", "cons_R68")
time1 = time1[,names(time1) %in% use.vars]
time2 = time2[,names(time2) %in% use.vars]

# merge two outputs together
R55_R68_Change = merge(time1 [],time2 [i], by = "latlong", stringsAsFactors=FALSE)

# calculate percent change
R55_R68_Change$percentChange = ((R55_R68_Change$cons_R68 - R55_R68_Change$cons_R55)/R55_R68_Change$cons_R55)
# make percentChange a matrix
R55_R68_Change$percentChange = as.matrix(percentChange)

# calculate absolute difference
R55_R68_Change$abDiff = (R55_R68_diff$cons_R68 - R55_R68_diff$cons_R55)
R55_R68_Change$abDiff = as.matrix(abDiff)

# read in the average gdp data
avegdp = read.csv("H:/Consumer Expenditure India/Analyis/Scripts/commodityDistribution/aveGDPnoZeros.csv", head=T, stringsAsFactors=FALSE)

# concatenate lat long
avegdp$unique = paste(avegdp$latitude, avegdp$longitude, sep='')

###########################################################################
### can i do this in one step



# # keep only relevant columns
# myvars2 = c("latlong", "AveGDP", "ChGDP")
# avegdp2 = avegdp[myvars2]

# merge with other table
R68_R55_Change_Merge = merge(R68_R55_Change,avegdp, by = "latlong", stringsAsFactors=FALSE)

# subset data for columns greater than zero for consumption
R68_R55_Change_Subset = subset(R68_R55_Change_Merge, R68_R55_Change_Merge$cons_R55 > 0 & R68_R55_Change_Merge$cons_R68 > 0)

################################################################################################
###################### how to name this iteratively
# write subset to csv
output.filename = gsub(" ", "", round1), gsub(" ", "", round2), 'urban', commodity
output.filepath = 

write.csv(R68_R55_Change_Subset, "H:/Consumer Expenditure India/Analyis/R55R68Change/ paste(names1 [i], 'csv', sep=''"))

}

#############################################################################################################################
#############################################################################################################################
#############################################################################################################################
#############################################################################################################################
#############################################################################################################################

###################################################
## SET WORKING DIRECTORY
#########################################################
setwd('//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/')

###########################################################
# list all files in folder
first = list.files(path = "//172.16. 156.233/K_Seto_Data/nutritionTransition/indiaGDP/R68_finalEstimationsUrbanTest", pattern="*.csv", recursive=FALSE)
filesnames<-gsub("_", "", files)
names<-gsub(".csv","", filesnames)

second = list.files(path = "//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/R55_finalEstimationsUrbanTest")
filesnames<-gsub("_", "", files)
names<-gsub(".csv","", filesnames)

for (i in 1:length(files)) {
# load R 68 file
time2 <- read.csv(input, header=T)

first$unique = (first$latitude, first





# change column names
colnames(time2)[5] <- "cons_R68"
colnames(time2)[2] <- "District2"

# concatenate lat long
concat = transform(time2,latlong=paste0(latitude,longitude))

# bind new columns together
time3 <- cbind(time2, concat)

#outfile
}

for (i in 1:length(files)) {
genTable(files[i])
}

##################################################################################################
##########################################Problem here

# list all files in folder
files2 = list.files(path = "//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/R55_finalEstimationsUrbanTest")
files2
filesnames2<-gsub("_", "", files2)
names2<-gsub(".csv","", filesnames2)
names2

genTable2 = function(input) {
# read the round 55 file
time1 = read.csv(input, header=T)
colnames(time1)[6] <- "cons_R55"

# concatenate lat long
concat2 = transform(time1,latlong=paste0(latitude,longitude))

# bind new columns together
time4 <- cbind(time1, concat2)

# keeping the relevant variables
myvars = c("STATE_DISTRICT", "cons_R55", "STATE_GIS", "DIST_GIS", "latitude", "longitude", "latlong")
time5 = time4[myvars]
colnames(time5)
}

for (i in 1:length(files2)) {
genTable2(files2[i])
}

lapply(files, function(x) {

# merge two outputs together
R55_R68_diff = merge(time3 [i],time5 [i], by = "latlong", stringsAsFactors=FALSE)

# calculate percent change
percentChange = ((R55_R68_diff$cons_R68 - R55_R68_diff$cons_R55)/R55_R68_diff$cons_R55)

# make percentChange a matrix
percentChange = as.matrix(percentChange)

# calculate absolute difference
abDiff = (R55_R68_diff$cons_R68 - R55_R68_diff$cons_R55)
abDiff = as.matrix(abDiff)

# bind percentChange back onto table
R68_R55_Change <- cbind(R55_R68_diff, percentChange, abDiff)

# read in the average gdp data
avegdp = read.csv("H:/Consumer Expenditure India/Analyis/Scripts/commodityDistribution/aveGDPnoZeros.csv", head=T, stringsAsFactors=FALSE)

# concatenate lat long
concat3 = transform(avegdp,latlong=paste0(latitude,longitude))

# keep only relevant columns
myvars2 = c("latlong", "AveGDP", "ChGDP")
avegdp2 = concat3[myvars2]

# merge with other table
R68_R55_Change_Merge = merge(R68_R55_Change,avegdp2, by = "latlong", stringsAsFactors=FALSE)

# subset data for columns greater than zero for consumption
R68_R55_Change_Subset = subset(R68_R55_Change_Merge, R68_R55_Change_Merge$cons_R55 > 0 & R68_R55_Change_Merge$cons_R68 > 0)

################################################################################################
###################### how to name this iteratively
# write subset to csv
write.csv(R68_R55_Change_Subset, "H:/Consumer Expenditure India/Analyis/R55R68Change/R68_R55_Urban_Wheat_Change.csv") 

}



