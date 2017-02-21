#Function which writes the behavioural scoring variable from "VideoScore" to each row of SCPP1Time using VideoTime
AddVideoScoreToSCPP1Data<-function(SCPP1Time, VideoTime, VideoScore){
  j<-1
  #SCPP1Score<-vector(length=length(SCPP1Time)) #Initialise vector for video score
  SCPP1Score<-c()
  SCPP1Score<-as.character(SCPP1Score)
  i<-1
  for(i in 1:length(VideoTime)){
    VideoScoreCurrent<-VideoScore[i]
    if(i<length(VideoTime)){ #condition and break needed to make sure that j!>length(VideoTime-1) so that while condition can be evaluated
        while(SCPP1Time[j]<=VideoTime[i+1]){
          if(j<length(SCPP1Time)){
                SCPP1Score[j]<-VideoScoreCurrent
                j<-j+1
          } else {
            break
            }
    
        } 
    }else{
        repeat{
          SCPP1Score[j]<-VideoScoreCurrent
          j<-j+1
        if(j==length(SCPP1Time)+1){
          break
        }
      }
      }
        
    
  }
return(SCPP1Score)
}