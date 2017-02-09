#Import data from all processor output files in data_dir to create a dataframe
#INPUT: data_dir is directory in local R folder with all processor output
# data_dir should be of the form 'Data/JFXXX_ChanY/SCPP1V1_TCL' if different from 3 level, then setwd() command at close needs to be amended
#OPERATION: Sets variable names and remove NaNs
#OUTPUT: Returns dataframe of data from all output files
#v1: 300716

ImportData<-function(data_dir){
  #Lists all files of form SCPP1V1.txt
  FileList<-list.files(path=data_dir, pattern="SCPP1V1.txt") #List of all files in working directory
  EndFile<-length(FileList)  #This will be changed to length of FileList
  for (i in 1:EndFile){
    #Write to a temp dataframe
    path_and_file<-paste(data_dir, FileList[i], sep="/") #Use full path to file to allow for knitr to work
    DF_temp<-read.table(path_and_file, sep=" ")
    #Change variable names
    names(DF_temp)<-c("FileName", "Seconds", "Chan", "EpochClass", "BPC", "SpikeCount", "Delta", "Theta")
    #Remove columns with null data
    DF_temp<-select(DF_temp, FileName, Seconds, Chan, EpochClass, SpikeCount, Delta, Theta) 
    #Add current temp dataframe to combined SCPP_DF
     if(i==1){
      SCPP_DF<-DF_temp
    }
    else{
      SCPP_DF<-rbind(SCPP_DF, DF_temp)
    }
  }
  
  return(SCPP_DF)
  
}