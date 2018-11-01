# func 
MeanWatchRate <- function(tmp){
  # make ans set
  tmp_ <- tmp %>% 
    filter(program_start_time >= as.POSIXct("2017-05-01 0:00:00", tz="UTC")) %>% 
    mutate(pre1 = program_start_time - weeks(1),
           pre2 = program_start_time - weeks(2),
           pre3 = program_start_time - weeks(3),
           pre4 = program_start_time - weeks(4))
  # parallel process1
  cl <- makeCluster(2); counter <- 1;
  registerDoParallel(cl); 
  ans1 <- foreach (i = 1:nrow(tmp_), .combine = c) %dopar% {
    for(j in counter:nrow(tmp)){
      if(tmp_$pre1[i] >= tmp$program_start_time[j] && tmp_$pre1[i] < tmp$program_start_time[j+1]){
        counter <- j; return(tmp$all_watch_rate[j]);
      }
    }
  }
  stopCluster(cl)
  #for(i in 1:nrow(tmp_)){
  #  for(j in counter:nrow(tmp)){
  #    if(tmp_$pre1[i] >= tmp$program_start_time[j] && tmp_$pre1[i] < tmp$program_start_time[j+1]){
  #      counter <- j; a <- tmp$all_watch_rate[j];
  #      }
  #  }
  #}
  # parallel process2
  cl <- makeCluster(2); counter <- 1;
  registerDoParallel(cl); 
  ans2 <- foreach (i = 1:nrow(tmp_), .combine = c) %dopar% {
    for(j in counter:nrow(tmp)){
      if(tmp_$pre2[i] >= tmp$program_start_time[j] && tmp_$pre2[i] < tmp$program_start_time[j+1]){
        counter <- j; return(tmp$all_watch_rate[j]); 
      }
    }
  }
  stopCluster(cl)
  # parallel process3
  cl <- makeCluster(2); counter <- 1;
  registerDoParallel(cl); 
  ans3 <- foreach (i = 1:nrow(tmp_), .combine = c) %dopar% {
    for(j in counter:nrow(tmp)){
      if(tmp_$pre3[i] >= tmp$program_start_time[j] && tmp_$pre3[i] < tmp$program_start_time[j+1]){
        counter <- j; return(tmp$all_watch_rate[j]); 
      }
    }
  }
  stopCluster(cl)
  # parallel process4
  cl <- makeCluster(2); counter <- 1;
  registerDoParallel(cl); 
  ans4 <- foreach (i = 1:nrow(tmp_), .combine = c) %dopar% {
    for(j in counter:nrow(tmp)){
      if(tmp_$pre4[i] >= tmp$program_start_time[j] && tmp_$pre4[i] < tmp$program_start_time[j+1]){
        counter <- j; return(tmp$all_watch_rate[j]); 
      }
    }
  }
  stopCluster(cl)
  # combine
  tmp_$rate1 = ans1; tmp_$rate2 = ans2; tmp_$rate3 = ans3; tmp_$rate4 = ans4;
  return(tmp_)
}