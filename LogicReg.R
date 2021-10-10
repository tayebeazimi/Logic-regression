library("xlsx")
library(readxl)
library(survival)
library(LogicReg)
train <- read_excel("E:/arshad/master_project/logic regression/train.xlsx")
# trainresponse <- read_excel("E:/arshad/master_project/logic regression/trainresponse.xlsx")
test <- read_excel("E:/arshad/master_project/logic regression/test.xlsx")


resp <-as.matrix(train[,7])
x <-as.matrix(train[,1:6])
cen <-as.matrix(train[,8])
testy <- as.matrix(test[,8])

myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 100) 


fit1 <- logreg(resp = resp, bin=x, type = 4,cens=cen, select = 1, ntrees = 3,nleaves = 2, anneal.control = myanneal)

plot(fit1)
plot(fit1) 
print(fit1)
#z <- predict(fit1) 
#plot(z, testy[,1]-z, xlab="fitted values", ylab="residuals") 

