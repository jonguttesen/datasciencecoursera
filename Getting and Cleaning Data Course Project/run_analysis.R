

## uncomment if you wish to download the file
#filename <- tempfile()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",filename)

## otherwise enter filename here
filename <- "~/Downloads/file7b15de95427"



#read data column names
datacnames <- read.table(unzip(filename, "UCI HAR Dataset/features.txt"))

#read activity labels
activitylabels <- read.table(unzip(filename, "UCI HAR Dataset/activity_labels.txt"))

#libra
#read testdata and training data
#

data1 <- read.table(unzip(filename, "UCI HAR Dataset/test/X_test.txt"))
data2 <- read.table(unzip(filename, "UCI HAR Dataset/train/X_train.txt"))

#merge data
data <- rbind(data1, data2)

#read labels
labels1 <- read.table(unzip(filename, "UCI HAR Dataset/test/y_test.txt"))
labels2 <- read.table(unzip(filename, "UCI HAR Dataset/train/y_train.txt"))

#merge labels
labels <- rbind(labels1, labels2)

#read subjects
subjects1 <- read.table(unzip(filename, "UCI HAR Dataset/test/subject_test.txt"))
subjects2 <- read.table(unzip(filename, "UCI HAR Dataset/train/subject_train.txt"))

#merge subjects
subjects <- rbind(subjects1, subjects2)

# apply column names on data1
names(data) <- tolower(datacnames$V2)

# use regular expression to extract only colums with names containing "mean()" or "std()"
data <- subset(data, select=grep( "mean\\(\\)|std\\(\\)", names(data)))

# Merge labels column and subjects column to data1
data$label <- labels[,1]
data$subject <- subjects[,1]

# Merge activity column to data
data <- merge( x=activitylabels, y=data, by.x = "V1", by.y = "label" )

#correct colum names
colnames(data)[colnames(data)=="V2"] <- "activity"

#remove label column
#colnames(data)[colnames(data)=="V1"] <- "label"
data$V1 <- NULL

#melt data by activity and subject
melteddata <- melt( data, id.vars = c( "activity", "subject") )

#extract only the average for each measure
result <- dcast( melteddata, activity + subject ~ variable, mean )


#unlink(temp)