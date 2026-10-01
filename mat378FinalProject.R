penguinsData = na.omit(penguins)
##descriptive statistics
summary(penguinsData)

penguinsData$malePenguin = ifelse(penguinsData$sex == "male",1,0)

##K-nearest neighbors for classification
partition.indA=sample(length(penguinsData$sex),size=
round(.7*length(penguinsData$sex)))
partition.ind=sort(partition.indA)

##initial test/training partitions
penguins.training=penguinsData[partition.ind,]
penguins.test=penguinsData[-partition.ind,]

##true classsifications
penguins.class = penguins.training$sex

##keep only the attributes we are interested in
penguins.newTraining = penguins.training[,-c(1,2,7,8)]
penguins.newTest = penguins.test[,-c(1,2,7,8)]

##construct model
library(class)
knn.class = knn(penguins.newTraining,penguins.newTest, cl = penguins.class, k=3, prob=TRUE)
knn.class

##create a vector of just the test set classifications
test.class=penguins.test[,7]

##compare knn results vs actual results
#a knn.result value of 1 indicates an obs. where the model was incorrect
knn.result = ifelse(test.class != knn.class,1,0)

##construct a matrix to visually compare as well as compute 
##misclassification rate
Compare.results = matrix()
Compare.results = cbind(penguins.test,penguins.test$sex,knn.class, knn.result)
mean(test.class != knn.class)
Compare.results

##Classification trees

dim(penguins.training)
dim(penguins.test)

library("rpart")
cart = rpart(sex~bill_len+bill_dep+flipper_len+body_mass,data=penguins.training,method="class")
library(rpart.plot)
rpart.plot(cart,main="Classification Tree")
test.class=as.character(predict(cart,penguins.test,type="class"))

compare.results=matrix()
compare.results=cbind(penguins.test$sex,test.class)

mean(penguins.test$sex!=test.class)

##Logistic Regression
logisticReg=glm(sex~bill_dep,data=penguinsData,family=binomial)
plot(penguinsData$bill_dep,penguinsData$malePenguin,xlab="bill depth",
ylab="male - 1 female - 0")
curve(predict(logisticReg,data.frame(bill_dep=x),type="resp"),add=TRUE,lwd=2)


logisticReg

##chi-square test##
with(logisticReg,null.deviance - deviance)
with(logisticReg,df.null-df.residual)
pchisq(48.72133,1,lower.tail=FALSE)
#with(logisticReg,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail=FALSE))

##wald test for an individual predictor##
summary(logisticReg)


##boxplot of attribute variables
boxplot(penguinsData$bill_dep,main="bill depth")
boxplot(penguinsData$bill_len,main="bill length")
boxplot(penguinsData$flipper_len,main="flipper length")
boxplot(penguinsData$body_mass,main="body mass")
hist(penguinsData$malePenguin,main="Sex Difference bar chart",ylab="Counts",xlab="Male or Female (0=Female 1 = Male)")









