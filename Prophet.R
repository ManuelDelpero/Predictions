setwd('C:/Users/Manuel/Desktop/Prophet')
# Forecast using the Quantmod library and the Prophet algorithm
#
# copyright (c) - Manuel Delpero
# first written december, 2020
# 

library(prophet)
library(quantmod) 

getSymbols("AAPL", from = '1995-01-01',
           to = "2020-03-01",warnings = FALSE,
           auto.assign = TRUE)
		   
df <- data.frame(AAPL)
df <- cbind(as.character(rownames(df)), as.numeric(as.character(df[,1])))
df <-  data.frame(df)
df[,1] <- as.character(df[,1])
df[,2] <- as.numeric(as.character(df[,2]))
colnames(df) <- c("ds", "y")
head(df)

m <- prophet(df, daily.seasonality=TRUE)
future <- make_future_dataframe(m, periods = 365)
forecast <- predict(m, future)

plot(m, forecast)

prophet_plot_components(m, forecast)