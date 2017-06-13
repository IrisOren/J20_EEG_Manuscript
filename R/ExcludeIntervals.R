#Exclude intervals:
# a)  classified as L
# b) with theta and delta power approx 0 (ie. transmitters off)
# c) Excessive delta power which we classify as artifacts. 
ExcludeIntervals <- function(DF, DeltaPowerThreshold){
  DF <-filter(DF , EpochClass!="L")
  DF <- filter(DF, Theta>0.00001 & Delta>0.00001)
  DF <- filter(DF, Delta > DeltaPowerThreshold)
return(DF)
  
  
  
  
}