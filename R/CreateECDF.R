CreateECDF<-function(DF, genotypeFactor, AnimalIDFactor){
SpikeCount_df<-data.frame(SpikeCount=DF$SpikeCount)

SpikeCount_df <- SpikeCount_df %>% group_by(SpikeCount) %>%  
  summarize(NumIntervals=n())

SpikeCount_df <- SpikeCount_df %>%  
  arrange(SpikeCount) %>% 
  mutate(CumFrequency=cumsum(NumIntervals))
#And Normalise CumFrequency by max of CumFrequency
  SpikeCount_df<- SpikeCount_df %>%
    mutate(CumFrequency=CumFrequency/max(CumFrequency))

#Add genotype
if(genotypeFactor=="WT"){
  SpikeCount_df <- SpikeCount_df %>% 
    mutate(Genotype=1)
}
else{
  SpikeCount_df <- SpikeCount_df %>% 
    mutate(Genotype=2)
}

 
  SpikeCount_df$Genotype<-as.factor(SpikeCount_df$Genotype)
  
  #Add animalID
  SpikeCount_df<- SpikeCount_df %>%
    mutate(AnimalID=AnimalIDFactor)


return(SpikeCount_df) 
}

