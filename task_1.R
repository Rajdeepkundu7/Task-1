#Task 1: Prediction Using Supervised ML
#Author: Rajdeep Kundu


library(MASS)                         #Calling the library 
library(ggplot2)
data=read.csv("scores.csv")           #Reading the given data
data
newdata=data.frame(x=9.25)            #Storing the given study hour
x=data$Hours                          #Extracting the hours of study
y=data$Scores                         #Extracting the scores 
model=lm(y~x)                         #Fitting linear model y=ß0+ß1x+e 
summary(model)                        #Details of the linear Regression fit
predict.lm(model,newdata)             #Predicting the score value for the given study hour
ggplot(data,aes(x,y)) + geom_point() +geom_smooth(method = "lm")+ labs(title = "Student Percentage vs Study Hours",
        x = "Study Hours",
        y = "Student Percentage")    #Representing the Students' Scores vs Study Hours through a scatterplot                         
resi=stdres(model)
resi                   #Obtaining the Residual values from the linear model
ggplot(data,aes(x, y = resi)) + geom_point() + geom_hline(yintercept=0)+ 
                                                          geom_hline(yintercept=-2, linetype="dashed", color = "red")+
                                                          geom_hline(yintercept=2, linetype="dashed", color = "red")
                                                          labs(title = "Student Percentage vs Study Hours",
                                                                                x = "Fitted Values",
                                                                                y = "Residuals")

                                     #Representing the Residual Values vs Fitted Values of the linear model through Scatterplot

#Conclusion
#For 9.25 hours of study hours, predicted score is 92.91
#Standardized Residuals are mostly Randomly Scattered.The explanatory variable explains the variability of dependent variable well.
#There is only one point to suspect for being influencial point
