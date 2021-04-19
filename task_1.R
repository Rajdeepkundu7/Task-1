data=read.csv("scores.csv")
data
newdata=data.frame(x=9.25)
x=data$Hours
y=data$Scores
model=lm(y~x)
summary(model)
predict.lm(model,newdata)
library(ggplot2)
ggplot(data,aes(x,y)) + geom_point() +geom_smooth(method = "lm")+ labs(title = "Student Percentage vs Study Hours",
        x = "Study Hours",
        y = "Student Percentage")
library(MASS)
resi=stdres(model)
ggplot(data,aes(x, y = resi)) + geom_point() + geom_hline(yintercept=0)+ 
                                                          geom_hline(yintercept=-2, linetype="dashed", color = "red")+
                                                          geom_hline(yintercept=2, linetype="dashed", color = "red")
                                                          labs(title = "Student Percentage vs Study Hours",
                                                                                x = "Fitted Values",
                                                                                y = "Residuals")