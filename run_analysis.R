## Read training and testing dataset

traindata <- read.table("./train/X_train.txt")
testdata <- read.table("./test/X_test.txt")

## Read training and testing subject

trainsubject <- read.table("./train/subject_train.txt")
testsubject <- read.table("./test/subject_test.txt")

## Read training and testing activity labels

trainlabel <- read.table("./train/y_train.txt")
testlabel <- read.table("./test/y_test.txt")

## Read read all features

features <- read.table("./features.txt")

## Merge training and testing data, activity labels and subject

mergeddata <- rbind(traindata,testdata)
mergedlabel <- rbind(trainlabel,testlabel)
mergedsubject <- rbind(trainsubject,testsubject)

##Set column names to data, activity labels and suject

names(mergeddata) <- features[,2]
names(mergedlabel) <- "activity"
names(mergedsubject) <- "subject"


## Column bind data , activity label and suject

combineddata <- cbind(mergeddata,mergedlabel,mergedsubject)


## Extracts mean and standard deviation for each measurement
## (keeps columns of activity and subject)

subdata <- combineddata[,grep("mean\\(\\)|std\\(\\)|activity|subject",names(combineddata))]

## Read activity names

actname <- read.table("./activity_labels.txt")

## Use descriptive activity names

subdata$activity <- factor(subdata$activity, labels = actname[,2])

## Label the data set with descriptive variable names
names(subdata)<-gsub("^t", "time", names(subdata))
names(subdata)<-gsub("^f", "frequency", names(subdata))
names(subdata)<-gsub("Acc", "Accelerometer", names(subdata))
names(subdata)<-gsub("Gyro", "Gyroscope", names(subdata))
names(subdata)<-gsub("Mag", "Magnitude", names(subdata))
names(subdata)<-gsub("BodyBody", "Body", names(subdata))

## Calculate average of each variable for each activity and each subject.

tidydata <- aggregate(.~subject+activity,data=subdata,mean)
tidydata <- tidydata[order(tidydata$subject),]
write.table(tidydata, file = "tidydata.txt",row.names=FALSE)
