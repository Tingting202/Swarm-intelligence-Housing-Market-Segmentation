#------Library packages------#
library("dplyr")
require(ggplot2)
require(MASS)
require(Hmisc)
require(reshape2)
library("nnet")
library("tidyverse") # for easy data manipulation and visualization
library("broom") # creates a tidy data frame from statistical test results
library("olsrr") # for OLS test
library("caret") # easy machine learning workflow
library("MASS")
library("modelr") # provides helper functions for computing regression performance metrics

#------Model establishement------#
full_original <- lm(unit_price ~ floor_area + land_area 
                    + percent_ratio + age + room 
                    + hall + bathroom + housing_type 
                    + floor_height + dis_MRT + quan_MRT
                    + dis_RailwayStation + dis_airport
                    + dis_interchange + dis_expressway
                    + quan_expressway + dis_university
                    + quan_university + dis_lib + quan_lib
                    + dis_ArtCenter + quan_ArtCenter
                    + dis_LargeRetail + quan_LargeRetail
                    + dis_DepartStore + quan_DepartStore
                    + dis_supermarket + quan_supermarket
                    + dis_nightmarket + quan_nightmarket
                    + dis_hospital + quan_hospital
                    + dis_police + quan_police
                    + dis_fire + quan_fire
                    + dis_CBD, data = swarm.data)

summary(full_original)

#------Model Diagnostics------#
#Four plots
par(mfcol = c(2,2))
plot(full_original)

#Residual Normality Test
ols_test_normality(full_original)

##Influential values - Cook's distance
plot(full_original, 4)

#------Multicollinearity------#
car::vif(full_original)

#------Stepwide selection------#
step_original <- stepAIC(full_original, direction = "backward",
                           trace = FALSE)

summary(step_original) #Repeat Model Diagnostics test for step_original

#------Regression performance metrics------#
data.frame(
  R2 = rsquare(step_original, data = swarm.data),
  Adj_R2 = glance(step_original)$adj.r.squared,
  AIC = AIC(step_original),
  BIC = BIC(step_original),
  RMSE = rmse(step_original, data = swarm.data),
  MSE = mse(step_original, data = swarm.data),
  MAE = mae(step_original, data = swarm.data),
  PE = sigma(step_original)/mean(swarm.data$unit_price, na.rm=TRUE)
)






