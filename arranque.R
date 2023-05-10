library(plumber)
getwd()
setwd('C:\\Users\\ainhi\\OneDrive\\Escritorio\\BDATA2\\ds1\\Baloncesto')
r <- plumb("api.R")  # Where 'plumber.R' is the location of the file shown above
#acaba de arranchar el fichero llamado plumber.R, a la espera de lo que le diga, con los servicios que tiene dentro
r$run(port=8008) 

