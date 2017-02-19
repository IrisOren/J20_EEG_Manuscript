#Function which writes the behavioural scoring variable from "VideoScore" to each row of SCPP1Time using VideoTime
AddVideoScoreToSCPP1Data<-function(SCPP1Time, VideoTime, VideoScore){
  j<-0
  SCPP1Score<-vector(length=length(SCPP1Time))    #Initialise vector for video score
  for(i in 1:(length(VideoTime)-1)){
    VideoScoreCurrent<-VideoScore[i]
    
    repeat{
      SCPP1Score[j]<-VideoScoreCurrent
      j<-j+1
      if(SCPP1Time[j]>=VideoTime[i+1]){
        break
      }
    }
  }
  
  
  return(SCPP1Score)
}