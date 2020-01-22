dataset = read.csv(file.choose())
dataset = dataset[2:3]
install.packages("rpart")
library(rpart)
regressor = rpart(formula = Salary~. ,data = dataset,control = rpart.control(minsplit = 2))

X_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+geom_point(aes(dataset$Level,dataset$Salary), color = 'red')+
  geom_line(aes(X_grid,predict(regressor,data.frame(Level=X_grid))),color = 'blue')+
  ggtitle('truth or bluff (decission tree regression)')+xlab('level')+ylab('salary')
