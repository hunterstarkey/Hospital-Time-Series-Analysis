rm(list = ls())
setwd("C:\\Users\\Path\\...")


install.packages("qcc")
library("qcc")

Incontrol_data <- read.csv("ControlArrivals.csv", header = FALSE)
Incontrol_data

Incontrol_data <- Incontrol_data$V3
Incontrol_data

summary(Incontrol_data)


#individual chart
controli <- qcc(Incontrol_data, type = "xbar.one", title = "Individual chart for Control data (Arrivals)", xlab = "Observations", ylab = "Individual Value", plot = TRUE)
#moving range chart
controlmr <- matrix(cbind(Incontrol_data[1:length(Incontrol_data)-1], Incontrol_data[2:length(Incontrol_data)]), ncol=2)
controlmr1 <- qcc(controlmr, type="R", title = "Moving Range chart for Control data (Arrivals)", xlab = "Observations", ylab = "Moving Range", plot = TRUE)
#specific points that lie outside the control limits
controli$violations
controlmr1$violations
#point 181 for i chart and point 40 for mr chart exceed the bounds
#so we discard these points and recalculate the control limits


#control after discarding points
Incontrol_data2 <- c(6,2,5,3,3,5,4,4,8,5,1,5,7,9,3,5,7,4,9,5,8,4,4,6,3,8,5,11,3,5,5,3,3,6,3,7,4,7,4,3,8,9,5,4,5,1,7,6,1,4,2,3,3,9,6,8,5,10,5,6,5,8,4,6,5,2,6,5,6,3,5,3,6,9,2,10,9,5,4,7,1,5,7,4,1,8,8,7,7,9,7,4,5,4,5,9,5,5,5,6,3,2,3,3,7,5,5,5,2,9,7,8,5,3,5,3,1,7,4,1,8,5,8,4,4,6,6,3,5,4,6,4,3,8,4,4,2,2,8,5,8,5,5,6,8,5,5,7,6,6,5,3,6,4,4,5,3,3,7,1,6,1,7,4,5,3,5,9,4,8,5,5,11,6,5,5,4,8,8,6,4,6,6,8,9,7
)
#individual chart
controli2 <- qcc(Incontrol_data2, type = "xbar.one", title = "Individual chart for Control data (Arrivals)", xlab = "Observations", ylab = "Individual Value", plot = TRUE)
#moving range chart
controlmr2 <- matrix(cbind(Incontrol_data2[1:length(Incontrol_data2)-1], Incontrol_data2[2:length(Incontrol_data2)]), ncol=2)
controlmr12 <- qcc(controlmr2, type="R", title = "Moving Range chart for Control data (Arrivals)", xlab = "Observations", ylab = "Moving Range", plot = TRUE)


#control limits for the control data become:
#i limits LCL=-1.55795, UCL=12.04182
#mr limits LCL=0, UCL=8.353681
#in control mean = 5.241935
#in control S.D. = 2.266628

#Applying the control limits on the test data
Test_data_1 <- c(5,8,8,4,2,2,2,4,6,4,7,9,2,2,6,4,8,7,6,4,7,2,6,4,6,3,4,5,5,4,5,9,3,6,3,6,7,4,10,2,4,3,5,7,4,5,2,4,3,3,6,8,7,4,2,4,6,3,4,5,4,6,6,4,4,4,5,8,6,4,4,4,6,4,3,4,3,4,10,6,8,6,9,4,6,8,10,1,2,7,5,6,2,3,4,5,5,3,4,10,4,7,6,1,3,7,3,4,5,5,2,4,4,5,3,3,5,10,2,6,6,2,5,7,5,9,3,3,5,10,3,6,2,3,3,4,6,14,2,4,6,7,6,2,12,3,5,6,6,5,6,5,4,5,5,3,7,6,9,3,5,5,9,2,7,2,5,7,3,7,9,5,4,6,4,6,6,5,3,6,4,4,6,3,7,9,1,4,5,4,7,3,1,3,4,5,6,1,6,2,5,5
)

#individual chart
test1i <- qcc(Test_data_1, type = "xbar.one", title = "Individual chart for Test data 1 (Arrivals)", xlab = "Observations", ylab = "Individual Value", limits = c(-1.55795, 12.04182), plot = TRUE)
#moving range chart
test1mr <- matrix(cbind(Test_data_1[1:length(Test_data_1)-1], Test_data_1[2:length(Test_data_1)]), ncol=2)
test1mr1 <- qcc(test1mr, type="R", title = "Moving Range chart for Test data 1 (Arrivals)", xlab = "Observations", ylab = "Moving Range", limits = c(0, 8.353681), plot = TRUE)
 #specific points that lie outside the control limits
test1i$violations
test1mr1$violations
#we find point 138 lie outside the control limits for i chart for test data 1
#and points 87, 138, 144, and 145 lie out the control limits for mr chart




#After discarding out of control data for test 1
Test_data_1controlled <- c(5,8,8,4,2,2,2,4,6,4,7,9,2,2,6,4,8,7,6,4,7,2,6,4,6,3,4,5,5,4,5,9,3,6,3,6,7,4,10,2,4,3,5,7,4,5,2,4,3,3,6,8,7,4,2,4,6,3,4,5,4,6,6,4,4,4,5,8,6,4,4,4,6,4,3,4,3,4,10,6,8,6,9,4,6,8,1,2,7,5,6,2,3,4,5,5,3,4,10,4,7,6,1,3,7,3,4,5,5,2,4,4,5,3,3,5,10,2,6,6,2,5,7,5,9,3,3,5,10,3,6,2,3,3,4,6,2,4,6,7,6,3,5,6,6,5,6,5,4,5,5,3,7,6,9,3,5,5,9,2,7,2,5,7,3,7,9,5,4,6,4,6,6,5,3,6,4,4,6,3,7,9,1,4,5,4,7,3,1,3,4,5,6,1,6,2,5,5
)

#individual chart
test1icontrolled <- qcc(Test_data_1controlled, type = "xbar.one", title = "Individual chart for Test data 1 (Arrivals)", xlab = "Observations", ylab = "Individual Value", limits = c(-1.55795, 12.04182), plot = TRUE)
#moving range chart
test1mrcontrolled <- matrix(cbind(Test_data_1controlled[1:length(Test_data_1controlled)-1], Test_data_1controlled[2:length(Test_data_1controlled)]), ncol=2)
test1mr1controlled <- qcc(test1mrcontrolled, type="R", title = "Moving Range chart for Test data 1 (Arrivals)", xlab = "Observations", ylab = "Moving Range", limits = c(0, 8.353681), plot = TRUE)
#specific points that lie outside the control limits
test1i$violations
test1mr1$violations



Incontrol_data2 <- c(6,2,5,3,3,5,4,4,8,5,1,5,7,9,3,5,7,4,9,5,8,4,4,6,3,8,5,11,3,5,5,3,3,6,3,7,4,7,4,3,8,9,5,4,5,1,7,6,1,4,2,3,3,9,6,8,5,10,5,6,5,8,4,6,5,2,6,5,6,3,5,3,6,9,2,10,9,5,4,7,1,5,7,4,1,8,8,7,7,9,7,4,5,4,5,9,5,5,5,6,3,2,3,3,7,5,5,5,2,9,7,8,5,3,5,3,1,7,4,1,8,5,8,4,4,6,6,3,5,4,6,4,3,8,4,4,2,2,8,5,8,5,5,6,8,5,5,7,6,6,5,3,6,4,4,5,3,3,7,1,6,1,7,4,5,3,5,9,4,8,5,5,11,6,5,5,4,8,8,6,4,6,6,8,9,7
)
Test_data_1controlled <- c(5,8,8,4,2,2,2,4,6,4,7,9,2,2,6,4,8,7,6,4,7,2,6,4,6,3,4,5,5,4,5,9,3,6,3,6,7,4,10,2,4,3,5,7,4,5,2,4,3,3,6,8,7,4,2,4,6,3,4,5,4,6,6,4,4,4,5,8,6,4,4,4,6,4,3,4,3,4,10,6,8,6,9,4,6,8,1,2,7,5,6,2,3,4,5,5,3,4,10,4,7,6,1,3,7,3,4,5,5,2,4,4,5,3,3,5,10,2,6,6,2,5,7,5,9,3,3,5,10,3,6,2,3,3,4,6,2,4,6,7,6,3,5,6,6,5,6,5,4,5,5,3,7,6,9,3,5,5,9,2,7,2,5,7,3,7,9,5,4,6,4,6,6,5,3,6,4,4,6,3,7,9,1,4,5,4,7,3,1,3,4,5,6,1,6,2,5,5
)

  wilcoxtest <- wilcox.test(Incontrol_data2, Test_data_1controlled)
  wilcoxtest
  residuals(wilcoxtest)

#if we are to evaluate how this hospital behaves, we should also account for the number of departures

Incontrol_data_departures <- c(2,1,3,3,5,2,2,3,1,4,1,2,4,2,2,1,2,3,6,5,6,4,1,6,3,9,6,7,2,5,5,1,1,5,6,7,6,5,2,4,5,6,5,2,2,7,2,3,3,3,4,5,1,4,6,2,5,3,2,4,4,6,10,3,3,6,4,3,8,6,6,6,2,4,7,5,3,5,5,14,8,1,4,3,4,5,2,2,2,4,6,5,8,4,3,2,2,3,5,4,4,3,3,2,7,5,6,5,6,6,2,5,3,4,5,5,4,4,5,3,3,4,2,2,6,5,6,4,3,2,4,3,3,4,2,1,8,4,7,3,9,4,7,4,2,3,6,2,5,2,2,3,4,3,3,1,4,4,5,3,3,1,6,3,3,2,6,3,2,6,3,2,3,5,3,4,2,4,6,4,9,4,4,2,8,3,3,3,2,2,4,5,2,8,4,6,3,5,3,5,4,5,7,3,7,2,4,3,8,2,4,6,2,5,3,9,1,5,7,6,2,3,4,4,7,5,5,4,2,3,2,3,5,3,2,4,4,4,5,2,3,4,4,4,1,2,2,1,3,1,1,1,3,2,1
)

#individual chart
controlidepartures <- qcc(Incontrol_data_departures, type = "xbar.one", title = "Individual chart for Control data (Departures)", xlab = "Observations", ylab = "Individual Value", plot = TRUE)
#moving range chart
controlmrdepartures <- matrix(cbind(Incontrol_data_departures[1:length(Incontrol_data_departures)-1], Incontrol_data_departures[2:length(Incontrol_data_departures)]), ncol=2)
controlmr1departures <- qcc(controlmrdepartures, type="R", title = "Moving Range chart for Control data (Departures)", xlab = "Observations", ylab = "Moving Range", plot = TRUE)
#specific points that lie outside the control limits
controlidepartures$violations
controlmr1departures$violations
#here we have points 63, 80 beyond limits for individual chart
#and points 63, 79, 81, 136, and 216 beyond limits for mr chart




#removing these points and recalculating control limits we have:
Incontrol_data_departures2 <- c(2,1,3,3,5,2,2,3,1,4,1,2,4,2,2,1,2,3,6,5,6,4,1,6,3,9,6,7,2,5,5,1,1,5,6,7,6,5,2,4,5,6,5,2,2,7,2,3,3,3,4,5,1,4,6,2,5,3,2,4,4,6,3,3,6,4,3,8,6,6,6,2,4,7,5,3,5,5,1,4,3,4,5,2,2,2,4,6,5,8,4,3,2,2,3,5,4,4,3,3,2,7,5,6,5,6,6,2,5,3,4,5,5,4,4,5,3,3,4,2,2,6,5,6,4,3,2,4,3,3,4,2,8,4,7,3,9,4,7,4,2,3,6,2,5,2,2,3,4,3,3,1,4,4,5,3,3,1,6,3,3,2,6,3,2,6,3,2,3,5,3,4,2,4,6,4,9,4,4,2,8,3,3,3,2,2,4,5,2,8,4,6,3,5,3,5,4,5,7,3,7,2,4,3,8,2,4,6,2,5,3,1,5,7,6,2,3,4,4,7,5,5,4,2,3,2,3,5,3,2,4,4,4,5,2,3,4,4,4,1,2,2,1,3,1,1,1,3,2,1
)

#individual chart
controlidepartures2 <- qcc(Incontrol_data_departures2, type = "xbar.one", title = "Individual chart for Control data (Departures)", xlab = "Observations", ylab = "Individual Value", plot = TRUE)
#moving range chart
controlmrdepartures2 <- matrix(cbind(Incontrol_data_departures2[1:length(Incontrol_data_departures2)-1], Incontrol_data_departures2[2:length(Incontrol_data_departures2)]), ncol=2)
controlmr1departures2 <- qcc(controlmrdepartures2, type="R", title = "Moving Range chart for Control data (Departures)", xlab = "Observations", ylab = "Moving Range", plot = TRUE)
controlidepartures2$violations
controlmr1departures2$violation
#points 26, 137, 177 beyond limits for i chart

Incontrol_data_departures3 <- c(2,1,3,3,5,2,2,3,1,4,1,2,4,2,2,1,2,3,6,5,6,4,1,6,3,6,7,2,5,5,1,1,5,6,7,6,5,2,4,5,6,5,2,2,7,2,3,3,3,4,5,1,4,6,2,5,3,2,4,4,6,3,3,6,4,3,8,6,6,6,2,4,7,5,3,5,5,1,4,3,4,5,2,2,2,4,6,5,8,4,3,2,2,3,5,4,4,3,3,2,7,5,6,5,6,6,2,5,3,4,5,5,4,4,5,3,3,4,2,2,6,5,6,4,3,2,4,3,3,4,2,8,4,7,3,4,7,4,2,3,6,2,5,2,2,3,4,3,3,1,4,4,5,3,3,1,6,3,3,2,6,3,2,6,3,2,3,5,3,4,2,4,6,4,4,4,2,8,3,3,3,2,2,4,5,2,8,4,6,3,5,3,5,4,5,7,3,7,2,4,3,8,2,4,6,2,5,3,1,5,7,6,2,3,4,4,7,5,5,4,2,3,2,3,5,3,2,4,4,4,5,2,3,4,4,4,1,2,2,1,3,1,1,1,3,2,1
)

#individual chart
controlidepartures3 <- qcc(Incontrol_data_departures3, type = "xbar.one", title = "Individual chart for Control data (Departures)", xlab = "Observations", ylab = "Individual Value", plot = TRUE)
#moving range chart
controlmrdepartures3 <- matrix(cbind(Incontrol_data_departures3[1:length(Incontrol_data_departures3)-1], Incontrol_data_departures3[2:length(Incontrol_data_departures3)]), ncol=2)
controlmr1departures3 <- qcc(controlmrdepartures3, type="R", title = "Moving Range chart for Control data (Departures)", xlab = "Observations", ylab = "Moving Range", plot = TRUE)
controlidepartures3$violations
controlmr1departures3$violation



install.packages("forecast")
library("forecast")
install.packages("metrics")
library("metrics")
acf(control_autocorrtest, plot=TRUE)

#read.csv(file = 'autocorrelationTestforControl.csv')
#testing for autocorrelation
control_autocorrtest <- c(6,2,5,3,3,5,4,4,8,5,1,5,7,9,3,5,7,4,9,5,8,4,4,6,3,8,5,11,3,5,5,3,3,6,3,7,4,7,4,12,3,8,9,5,4,5,1,7,6,1,4,2,3,3,9,6,8,5,10,5,6,5,8,4,6,5,2,6,5,6,3,5,3,6,9,2,10,9,5,4,7,1,5,7,4,1,8,8,7,7,9,7,4,5,4,5,9,5,5,5,6,3,2,3,3,7,5,5,5,2,9,7,8,5,3,5,3,1,7,4,1,8,5,8,4,4,6,6,3,5,4,6,4,3,8,4,4,2,2,8,5,8,5,5,6,8,5,5,7,6,6,5,3,6,4,4,5,3,3,7,1,6,1,7,4,5,3,5,9,4,8,5,5,11,6,5,5,4,8,8,13,6,4,6,6,8,9,7
)
control_autocorrtest
Acf(control_autocorrtest, plot=TRUE)
pacf(control_autocorrtest, plot=TRUE)

#Arima Forecast
fit <- auto.arima(control_autocorrtest)
fit
arimapred <- (forecast(fit, h = 12))
arimapred
plot(arimapred)
plot(forecast(auto.arima(ts(control_autocorrtest,frequency=160),D=1),h=24), main="ARIMA Forecast for Control Data")

#The Llung-Box test tests the overall randomness based on a number of lags
Box.test(control_autocorrtest, lag = 0, type = c("Ljung-Box"), fitdf = 0)
#p-value <= .05, is statistically significant
#p-value > .05 is not statistically significant


#CUSUM chart
#We assume this is phase 2 of the process, and the process is in control
#based on the results from the control data obtained in phase 1
#we apply it to the test data
Incontrol_data_cusum <- c(6,2,5,3,3,5,4,4,8,5,1,5,7,9,3,5,7,4,9,5,8,4,4,6,3,8,5,11,3,5,5,3,3,6,3,7,4,7,4,3,8,9,5,4,5,1,7,6,1,4,2,3,3,9,6,8,5,10,5,6,5,8,4,6,5,2,6,5,6,3,5,3,6,9,2,10,9,5,4,7,1,5,7,4,1,8,8,7,7,9,7,4,5,4,5,9,5,5,5,6,3,2,3,3,7,5,5,5,2,9,7,8,5,3,5,3,1,7,4,1,8,5,8,4,4,6,6,3,5,4,6,4,3,8,4,4,2,2,8,5,8,5,5,6,8,5,5,7,6,6,5,3,6,4,4,5,3,3,7,1,6,1,7,4,5,3,5,9,4,8,5,5,11,6,5,5,4,8,8,6,4,6,6,8,9,7
)
cusum(Incontrol_data_cusum, PLOT = "TRUE")
#chart is in control with:
#in control mean = 5.241935
#in control S.D. = 2.266628
#decision interval (std. err.) = 5
#shift detection (std. err.) = 1

#test 1 cusum
Test1data_cusum <- c(5,8,8,4,2,2,2,4,6,4,7,9,2,2,6,4,8,7,6,4,7,2,6,4,6,3,4,5,5,4,5,9,3,6,3,6,7,4,10,2,4,3,5,7,4,5,2,4,3,3,6,8,7,4,2,4,6,3,4,5,4,6,6,4,4,4,5,8,6,4,4,4,6,4,3,4,3,4,10,6,8,6,9,4,6,8,10,1,2,7,5,6,2,3,4,5,5,3,4,10,4,7,6,1,3,7,3,4,5,5,2,4,4,5,3,3,5,10,2,6,6,2,5,7,5,9,3,3,5,10,3,6,2,3,3,4,6,14,2,4,6,7,6,2,12,3,5,6,6,5,6,5,4,5,5,3,7,6,9,3,5,5,9,2,7,2,5,7,3,7,9,5,4,6,4,6,6,5,3,6,4,4,6,3,7,9,1,4,5,4,7,3,1,3,4,5,6,1,6,2,5,5
)
cusum(Test1data_cusum, title = "CUSUM chart for Test_data_1 (Phase I)", xlab = "Observations", PLOT = "TRUE")
cusum(Test1data_cusum, title = "CUSUM chart for Test_data_1 (Phase II)", xlab = "Observations", std.dev = 2.266628, center = 5.241935, decision.interval = 5, se.shift = 1, PLOT = "TRUE")
getH(ARL)

#test 2 cusum
Test2data_cusum <- c(11,5,2,9,3,3,8,6,7,4,2,3,3,6,9,5,3,5,3,6,3,4,4,6,7,3,5,3,6,2,4,7,5,4,2,4,9,3,5,10,7,8,5,5,7,4,8,4,7,3,7,3,1,5,6,7,3,4,4,5,9,6,7,1,4,7,1,5,4,5,4,6,7,5,8,5,5,2,6,5,2,3,7,3,5,3,9,6,5,6,6,3,6,7,7,5,2,5,6,4,5,7,5,4,7,3,5,7,5,4,6,10,5,7,1,5,3,2,5,4,6,5,2,3,4,3,7,4,5,1,8,5,5,4,6,3,4,6,2,4,7,2,3,5,8,6,8,6,6,7,5,10,3,6,7,8,5,3,5,7,7,5,8,5,3,2,4,4,3,5,8,4,6,6,4,4,7,3,4,1,4,6,7,4,5,2,5,2,5,3,8,2,5,4,7,10,6,3,2,7,2
)
cusum(Test2data_cusum, std.dev = 2.266628, center = 5.241935, decision.interval = 5, se.shift = 1, PLOT = "TRUE")

#test 3 cusum
Test3data_cusum <- c(3,2,7,4,2,5,3,3,6,9,8,4,6,1,3,3,11,6,8,3,5,4,6,3,4,8,3,6,7,4,6,6,4,3,6,5,2,9,5,10,5,5,5,7,6,9,5,4,4,5,10,4,3,4,7,5,7,6,3,3,4,2,5,3,7,7,3,5,5,3,3,1,2,3,6,7,4,3,4,4,6,5,7,4,8,3,5,4,4,2,8,6,6,7,6,3,1,5,6,9,3,9,6,2,4,2,6,4,3,4,3,7,7,5,7,7,4,6,7,1,4,2,1,8,6,5,2,7,4,2,6,2,2,7,4,4,2,7,7,4,7,6,3,3,4,3,2,1,2,8,6,6,6,5,6,3,11,1,5,4,4,4,4,5,7,6,5,4,4,3,6,4,1,3,8,5,5,9,5,2,2,5,7,8,7,8,6,6,3,12,3,2,7,7,4,6,4,6,5,4,8,1,9,3,2
)
cusum(Test3data_cusum, std.dev = 2.266628, center = 5.241935, decision.interval = 5, se.shift = 1, PLOT = "TRUE")


rm(list = ls())
