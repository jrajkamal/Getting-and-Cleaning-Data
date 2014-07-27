#setwd("C:/Users/cs/Coursera/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset")



x_tr <- read.table ("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
y_tr <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE)
x_te <- read.table ("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
y_te <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep = "", header = FALSE)
activelabel <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
varlabel <- read.csv("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
subject_tr <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
subject_te <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)


# Build a data set for the Activities
y <- rbind(y_tr,y_te)
colnames(y) <- c("ID")
colnames(actlabel) <- c("ID", "Activities")
ylabel <- data.frame(activelabel[y$ID, "Activities"])
colnames(ylabel) <- c("Activities")


# Build a data set for the Measurements
x <- rbind(x_tr,x_te)
colnames(x) <- varlabel[[2]]

# Build a data set for the Subjects
subject <- rbind(subject_tr,subject_te)
colnames(subject) <- c("Volunteers")

# Merge data (Subjects, Activities and Measurements)
dataset <- cbind(subject,ylabel)
dataset <- cbind(dataset,x)

# Extract only the measurements for the mean and standard deviation
tidy <-dataset[c(1,2,grep("mean\\(", colnames(dataset)),
                 grep("std\\(", colnames(dataset)))]

# Create an aggregate data set (mean)
tidy.mean <- aggregate(tidy[3:68], 
                       by=list(Volunteers=tidy$Volunteers,
                               Activities=tidy$Activities),
                       FUN=mean)

# Write output files
write.table(tidy, "tidydata.txt", sep="\t")
write.table(tidy.mean, "tidydata.mean.txt", sep="\t")
