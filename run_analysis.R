## load the test data and trainning data, into data frame, seperately. Then 
## merge the two table together
   test_data <- read.table("./test/X_test.txt");
   test_activity <- read.table("./test/y_test.txt");
   test_id <- readLines("./test/subject_test.txt");
   test_tb <- cbind(test_id, test_activity, test_data);
   names(test_tb)[1:2]<- c("id", "activity");
   train_data <- read.table("./train/X_train.txt");
   train_activity <- read.table("./train/y_train.txt");
   train_id <- readLines("./train/subject_train.txt");
   train_tb <- cbind(train_id, train_activity, train_data);
   names(train_tb)[1:2]<- c("id", "activity");
   all_tb <- rbind(test_tb, train_tb);

   
## load activity labels, and edit;
## load feature names
   name_activity <- read.table("activity_labels.txt", stringsAsFactors = FALSE);
   acts <- name_activity[,2];
   name_feature <- readLines("features.txt");
   
## name the variables, only keep the mean and standard deviation of 
## measurments. replace the activity value by meaningful words
   names(all_tb) <- c("id", "activity", name_feature);
   outdat1 <- all_tb %>% 
   select(id, activity, contains("mean"), contains("std"), -contains("angle")) %>%
   mutate(activity = acts[activity]);
   
## rename the measurements/variable names
   tb_names <- names(outdat1);
   new_names <- sub("[0-9]+ ", "",tb_names);
   new_names <- sub("[()]+", "", new_names);
   names(outdat1) <- new_names;
   outdat1[,1] <- as.numeric(outdat1[,1]);
   
## generate a tidy dataset, group the data by each actvitiy, and calculate 
## the average for each variable and subject(id)
   dat2 <- group_by(outdat1, id, activity);
   outdat2 <- summarize_each(dat2, mean)%>%
   arrange(id,activity);
   write.table(outdat2, file = "prj_data_tidy.txt", row.names = FALSE)
   