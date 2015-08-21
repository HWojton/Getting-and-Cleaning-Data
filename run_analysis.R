#Reading datasets into R 

    #Test data
    X_test<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/test/X_test.txt")
    Y_test<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/test/y_test.txt")
    subject_test<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/test/subject_test.txt")

    #Training data
    X_train<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/train/X_train.txt")
    Y_train<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/train/y_train.txt")
    subject_train<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/train/subject_train.txt")

#Merging and labeling x datasets
    
    Xdata<-rbind(X_test, X_train)
        #adding column names
        Columns<-read.table("C:/Users/heather.haught/Documents/R/UCI HAR Dataset/features.txt")
            Columns2<-t(Columns)
                Columns3<-Columns2[-1,]
                    colnames(Xdata)<-Columns3
           
#Extracting variables from Xdata that are Means and Standard Deviations
        means<-Xdata[, grepl("mean", names(Xdata))]
        std<-Xdata[, grepl("std", names(Xdata))]
            XdataNew<-cbind(means,std)

#Merging and labeling y and subject datasets
    
        Ydata<-rbind(Y_test, Y_train)
                #adding column names
                colnames(Ydata)<-"Activity"
                    #adding activity labels
                       ActivityLabel<-c('Walking', 'Walking_upstairs', 'Walking_downstairs', 'Sitting', 'Standing', 'Laying')
                            Ydata$Activity<-ActivityLabel[Ydata$Activity]                                                    
    
        STdata<-rbind(subject_test, subject_train)
                #adding column names
                colnames(STdata)<-"ID"
    
#Combining columns of XdataNew, Ydata, and STdata into 1 dataset
    Samsungdata<-cbind(STdata, Ydata, XdataNew)

#Cleaning up variable names
    colnames(Samsungdata)<-gsub("-","", names(Samsungdata))
    Samsungdata[, gsub("()", "", names(Samsungdata))]

#Generating dataset with the average of each variable for each activity and subject
    SSData2<-melt(Samsungdata, id.vars=c("ID","Activity"), measure.vars=3:81)
    SSData3<-dcast(SSData2, ID ~ Activity + variable, mean)

#Exporting to text file
    write.table(SSData3, "C:/Users/heather.haught/Documents/R/UCI HAR Dataset/SSData3.txt", row.name=FALSE, sep="\t")
    
    
    
    
    
    