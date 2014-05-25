# I assume that the dataset zip is unzipped in "data" directory
if (!file.exists("./data/UCI HAR Dataset")){
        stop("please unzip the dataset in ./data/UCI HAR Dataset")
}

library("reshape2")
# merging test and train data
mergeTestAndTrain <- function() {
        # read test set and labels
        testSet  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
        
        # read train set and labels
        trainSet  <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
        
        # merge train and test set
        mainSet  <- rbind(testSet,trainSet);
        mainSet
}

# set features
setFeatures  <- function(data){
        # read features to set colonums names of my merged data set
        setColNames  <- read.table("./data/UCI HAR Dataset/features.txt", header=FALSE)
        colnames(data)  <- setColNames$V2
        data
}

# subset: keep only  mean and std measurement 
keepMeanAndStd  <-  function(data){
        meanSDColNames  <- grep(".*mean\\(\\)|.*std\\(\\)", colnames(data))
        meanSDData  <-  data[,meanSDColNames] 
        
        #Appropriately labels the data set
        colNames <- colnames(meanSDData)
        colNames <- gsub('\\(|\\)',"", colNames)
        colNames <- gsub('\\-',"", colNames)  
        colNames <- gsub('\\,',"",  colNames)
        colNames <- gsub('mean', colNames, replacement="Mean")
        colNames <- gsub('std',  colNames, replacement="Std")
        colnames(meanSDData) <- colNames
        meanSDData
}

# set activities
setActivities  <-  function(data){
        # set Activity IDs
        activityID  <- rbind(read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE),read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE) )
        data$ActivityID  <-activityID$V1
        
        # set Activity Labels
        activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c("ActivityID", "ActivityName"))
        data  <-  merge(data,activityLabels)
        data
}

# set subject
setSubjects  <- function(data){
        # set subject IDS
        subjectID  <- rbind(read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE),read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE) )
        data$SubjectID  <-subjectID$V1
        data
}

#tidy data set with the average of each variable for each activity and each subject
setTidyData  <-  function(data) {
        vars  <- c("ActivityID", "ActivityName", "SubjectID")
        dataMelt  <- melt(data, id=vars, measure.var=setdiff(colnames(data), vars))
        dcast(dataMelt, ActivityName + SubjectID ~ variable, mean)
        
}
# call all functions to create the tidy data
getAndCreateTidyData  <- function(){
        mergedData  <- mergeTestAndTrain()
        dataWithFeatues  <- setFeatures(mergedData)
        subsetData  <- keepMeanAndStd(dataWithFeatues)
        dataWithActivities  <-  setActivities(subsetData)
        dataWithubjects  <- setSubjects(dataWithActivities)
        tidyData  <- setTidyData(dataWithubjects)
        write.table(tidyData, "averages.txt")
}
print ("processing data. please wait... :) ")
getAndCreateTidyData()
print ("done without erros. Check your working directory to get tidy.txt ! ")
