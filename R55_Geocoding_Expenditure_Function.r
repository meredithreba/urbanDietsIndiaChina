#### Script for Geolocating Expenditure data
#### January 21, 2016

# remove old variables
rm(list= ls())

# install packages
# install.packages('plyr', repos='http://cran.us.r-project.org')
# library (plyr)

###################################################
##AVOID OUTPUT IN SCIENTIFIC FORMAT
###################################################
options(scipen=999)
###################################################

###################################################
## SET WORKING DIRECTORY
#########################################################
setwd('H:/Consumer Expenditure India/R55/Rural_new/')
#setwd('H:/Consumer Expenditure India/R55/Urban_new/')

# list all files in folder - separately for urban and rural
files = list.files(path = "H:/Consumer Expenditure India/R55/Rural_new", pattern="*.csv", recursive=FALSE)
#files = list.files(path = "H:/Consumer Expenditure India/R55/Urban_new", pattern="*.csv", recursive=FALSE)
#files = list.files(path = "//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/Round 55/Estimation Outputs/Reanalysis/Rural_new", pattern="*.csv", recursive=FALSE)
#files = list.files(path = "//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/Round 55/Estimation Outputs/Reanalysis/Urban_new", pattern="*.csv", recursive=FALSE)

name<-gsub(".csv","EXP", files)

genGeocode =  function(input,names1,i) {

estimate <- read.csv(input, header=T)
#estimate <- read.csv("//172.16.156.233/K_Seto_Data/nutritionTransition/indiaGDP/Round 55/Estimation Outputs/Reanalysis/Rural_new/Round55_Rural_Rice.csv", header=T)

# concatenate the state and district code add 
newEstimate = transform(estimate, STATE_DISTRICT=interaction(State, District,sep=''),stringsAsFactors=FALSE)
# head(newEstimate)
# str(newEstimate)

# read the lookup table
# separately for urban and rural
lookUp = read.csv("H:/Consumer Expenditure India/Analyis/R55_Rural_EXP_GEO.csv",head=T, stringsAsFactors=FALSE)
#lookUp = read.csv("H:/Consumer Expenditure India/Analyis/R55_Urban_EXP_GEO.csv",head=T, stringsAsFactors=FALSE)

# head(lookUp)
# str(lookUp)

# merge files
mergedGeo = merge(newEstimate,lookUp, by = "STATE_DISTRICT", stringsAsFactors=FALSE)
# head(mergedGeo)
# tail(mergedGeo)
# nrow(mergedGeo)

# write subset to csv
write.csv(mergedGeo, paste(names1[i],'.csv',sep='')) 

}

for (j in 1:length(files)) {
genGeocode(files[j],names1=name,j)
}



