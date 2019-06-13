#_______________________________________________________________________________
# this file is a list of non-trivial commands for R

setwd(dirname(rstudioapi::getActiveDocumentContext()$path)); #set working directory to this folder, RStudio
setwd(getSrcDirectory()[1]) #set working directory to this folder, R

#_______________________________________________________________________________
#operations are always component-wise

#sequence from 1 to 10
variable <- seq(1,10,by=1);
variable <- seq(1,10,len=10);

#matrices
mat <- rbind(variable,variable) # by row
mat <- cbind(variable,variable) # by column
mat <- matrix(data = variable, nrow = 2, ncol = 5, byrow = F)
mat <- t(mat) # transpose of a matrix
mat %*% mat # Matrix multiplication
solve(mat) # inverse of a matrix
A <- matrix(c(11,13,12,14), ncol=2, nrow=2, byrow=TRUE)
b <- c(1,1)
solve(A,b) # Ax=b

#_______________________________________________________________________________
#Categorical data

values <- factor(values,levels=categories) # from normal data to categoric data
absfre <- table(values) # table of absolute frequences
relfre <- table(values)/length(values) # table of relative frequences

#_______________________________________________________________________________
#Lists

mylist <- list (nameofobject = contentofobject, nameofobject2 = contentofobject2)
mylist$nameofobject
mylist[[2]] #double bracket to access the n-th element

#_______________________________________________________________________________
#Data frame: objects made of vectors of the same lengths

mydf <- data.frame (nameofobject = contentofobject, nameofobject2 = contentofobject2)
mydf$nameofobject
attach(mydf)
detach(mydf)

#_______________________________________________________________________________
#Import and export data

mydata <- read.table('mydata.txt', header=T) #import
write.table(mydata, file = 'mydata2.txt') #export
save(obj1,obj2,obj3, file = 'myobjects.RData') #save some objects
save.image("myobjects.RData") #save all objects
rm(list=ls()) #remove all objects
load("myobjects.RData") #load these objects

#_______________________________________________________________________________
#Indices
colMeans(mydf) #means by column
sapply(mydf, mean) #means by column
sapply(mydf, sd) #std by column
sapply(mydf, var) #variance by column
cov(mydf) #covariance matrix
cor(mydf) #correlation matrix

#_______________________________________________________________________________
#Plots
quartz() #Mac
x11() #Windows
par(mfrow=c(3,4)) #split the screen
hist(mydata,prob=T,main="Title",xlab="xlabel")
boxplot(mydata,main="Title",xlab="xlabel")
plot(mydatax,mydatay, main="Title",xlab="xlabel",ylab="ylabel")
dev.off() #close all