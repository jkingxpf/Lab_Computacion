## # package with a lot of datasets 
library (MASS) # install if error ##

data(Boston) #Housing Values in Suburbs of Boston ## names(Boston) ##
View(Boston) ## ?Boston # See the descriptions of columns



lm.fit =lm(medv~lstat,data=Boston) 
## #the same that ## #attach (Boston ) ##
#lm.fit =lm(medv∼lstat) ## lm.fit ##
lm.fit


summary(lm.fit)

names(lm.fit) #
coefficients(lm.fit) 



confint (lm.fit)



attach(Boston) ## 
# differents plots ## 
plot(lstat ,medv ,col ="red ") ##
plot(lstat ,medv ,pch =20) ## 
plot(lstat ,medv ,pch ="+") ## 
abline (lm.fit)
## 
abline (lm.fit ,lwd =3) ## 
abline (lm.fit ,lwd =3, col ="red ")



par(mfrow =c(2,2)) 
## # divides the plotting region into a 2 × 2 grid of panels ## 
plot(lm.fit)



plot(predict (lm.fit), residuals(lm.fit)) ## 
plot(predict (lm.fit), rstudent(lm.fit))



plot(hatvalues (lm.fit )) ## 
which.max (hatvalues (lm.fit))



lm.fit2 =lm(medv~lstat+age ,data=Boston ) 
lm.fit2 
summary (lm.fit2)



lm.fit3 =lm(medv~.,data=Boston ) ## 
summary (lm.fit3)



lm.fit4 <- lm(medv~lstat*age ,data=Boston ) ## 
summary (lm.fit4)



lm.fit5 <- lm(medv~lstat+I(lstat^2) ,data=Boston ) ## 
summary (lm.fit5)



par(mfrow=c(2,2)) 
plot(lm.fit) 
plot(lm.fit5)



anova(lm.fit ,lm.fit5)

