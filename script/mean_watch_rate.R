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
  cl <- makeCluster(detectCores())
  counter <- 1
  registerDoParallel(cl)
  on.exit(stopCluster(cl)) 
  ans <- foreach (i = 1:nrow(tmp_), .combine = c) %dopar% {
    for(j in 1:nrow(tmp)){
      if(tmp_$pre1[i] >= tmp$program_start_time[j] && tmp_$pre1[i] < tmp$program_start_time[j+1]){
        return(tmp$all_watch_rate[j])
        break
      }
    }
  }
  return(bind_cols(tmp_,ans))
}