#Exclude intervals:
# a)  classified as L
# b) with theta and delta power approx 0 (ie. transmitters off)
# c) Excessive delta power which we classify as artifacts. Factor is Factor*SDDelta for exclusion
ExcludeIntervals <- function(DF, Factor){
  DF <-filter(DF , EpochClass!="L")
  DF <- filter(DF, Theta>0.00001 & Delta>0.00001)
  MeanDelta<-mean(DF$Delta)
  sdDelta<-sd(DF$Delta)
  DF <- filter(DF, Delta < MeanDelta+5*sdDelta)
  return(DF)
  
  
  
  
}