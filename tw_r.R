library(quantmod) 

getSymbols(c("^TWII"),src="yahoo" ,from ="2012-01-01") 

dataOut = data.frame(index(TWII), TWII)
write.csv(dataOut[,2:7], file = "tw.CSV")

