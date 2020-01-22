stats=read.csv(file.choose())
x=stats
stats$Age =ifelse(is.na(stats$Age),ave(stats$Age,FUN= function(x) mean(x,na.rm = TRUE)),stats$Age)
stats$Salary =ifelse(is.na(stats$Salary),ave(stats$Salary,FUN= function(x) mean(x,na.rm = TRUE)),stats$Salary)

#encoding catagorial variable
stats$Country=factor(stats$Country,levels = c('France','Spain','Germany'), labels = c(1 , 2 , 3))
stats$Purchased=factor(stats$Purchased,levels = c('Yes','No') , labels = c(1,0))
stats

# train and test set

install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(stats$Purchased,SplitRatio = 0.8)
training_set= subset(stats, split== TRUE)
test_set= subset(stats, split != TRUE)

#feature scaling 
training_set[,2:3]= scale(training_set[,2:3])
test_set[,2:3]= scale(test_set[,2:3])
