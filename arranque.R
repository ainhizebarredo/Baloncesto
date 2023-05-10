library(plumber)
getwd()
r<-plumb('api.R')
r$run(rport=8008)