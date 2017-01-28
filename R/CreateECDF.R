CreateECDF<-function(DF){
SpikeCount_df<-data.frame(SpikeCount=DF$SpikeCount)

SpikeCount_df <- SpikeCount_df %>% group_by(SpikeCount) %>%  
  summarize(NumIntervals=n())

SpikeCount_df <- SpikeCount_df %>%  
  arrange(SpikeCount) %>% 
  mutate(CumFrequency=cumsum(NumIntervals))
return(SpikeCount_df) 
}

