#Set the working directory to where the script and the Samsung data can be found
# in this case, my working directory is C:/Documents.../gohks/My Documents/Github/cleandata

setwd("C:/Documents and Settings/gohks/My Documents/GitHub/cleandata")

# Read feature labels
features <- read.table(normalizePath(file.path(".","UCI HAR Dataset","features.txt")))

# Read activity labels
activities <- read.table(normalizePath(file.path(".","UCI HAR Dataset","activity_labels.txt")))

testdir <- file.path(".","UCI HAR Dataset","test")
traindir <- file.path(".","UCI HAR Dataset","train")

# Initialize the holder data frame
holder <- NULL

for (i in 2:length(dir(testdir))){
	testfilename <- file.path(testdir,dir(testdir)[i])
 	testdata <- read.table(normalizePath(testfilename))
 	trainfilename <- file.path(traindir,dir(traindir)[i])
 	traindata <- read.table(normalizePath(trainfilename))
	if(i==2) 
		holder <- rbind(testdata, traindata)
	else
 		holder <- cbind(holder,rbind(testdata, traindata))
}

# Rename the columns in the data frame

names(holder)[1] <- "subject"
names(holder)[ncol(holder)] <- "activity"

for(i in 2:(ncol(holder)-1)){
	names(holder)[i] <- toString(features[(i-1),2])
}

# Recode the activities 
for(i in 1:nrow(activities)){
   code <- activities[i,1]
   name <- toString(activities[i,2])
   holder$activity <- replace(holder$activity, holder$activity == code,name) 
}


final <- holder[ , grepl("subject|mean\\()|std\\()|activity" , names(holder))]
write.table(final, "tidydata.txt")


