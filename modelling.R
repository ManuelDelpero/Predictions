#
# Basic predictions
#
# copyright (c) 2020 - Manuel Delpero
# last modified Feb, 2020
# first written Feb, 2020
#


setwd("C:/Users/Manuel/Desktop/matteo/Data")

years <- read.csv("time.txt", sep = "\t", check.names = FALSE, header = TRUE)
luglio <- as.numeric(years[1,]) 
agosto <- as.numeric(years[2,]) 
settembre <- as.numeric(years[3,]) 
ottobre <- as.numeric(years[4,]) 
novembre <- as.numeric(years[5,]) 
dicembre <- as.numeric(years[6,])

timepoints <- as.numeric(colnames(years))
mluglio <- lm(luglio ~ timepoints)
magosto <- lm(agosto ~ timepoints)
msettembre <- lm(settembre ~ timepoints)
mottobre <- lm(ottobre ~ timepoints)
mnovembre <- lm(novembre ~ timepoints)
mdicembre <- lm(dicembre ~ timepoints)

timevalues <- c(2016, 2017, 2018, 2019, 2020)
exponentialLUG <- predict(mluglio, list(timepoints = timevalues), interval = "confidence",level = 0.95)
exponentialAGO <- predict(magosto, list(timepoints = timevalues), interval = "confidence",level = 0.95)
exponentialSET <- predict(msettembre, list(timepoints = timevalues), interval = "confidence",level = 0.95)
exponentialOTT <- predict(mottobre, list(timepoints = timevalues), interval = "confidence",level = 0.95)
exponentialNOV <- predict(mnovembre, list(timepoints = timevalues), interval = "confidence",level = 0.95)
exponentialDIC <- predict(mdicembre, list(timepoints = timevalues), interval = "confidence",level = 0.95)

write.table(exponentialLUG, file = "luglio.txt", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(exponentialAGO, file = "agosto.txt", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(exponentialSET, file = "settembre.txt", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(exponentialOTT, file = "ottobre.txt", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(exponentialNOV, file = "novembre.txt", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(exponentialDIC, file = "dicembre.txt", sep = "\t", quote = FALSE, row.names = FALSE)