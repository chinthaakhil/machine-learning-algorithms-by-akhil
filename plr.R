dataset = read.csv(file.choose())



dataset = dataset[2:3]
#linear regression
lin_reg = lm(formula = Salary ~ Level , data = dataset)

# fitting polynomial regression
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
poly_reg = lm(formula = Salary ~ . , data =dataset)

#visualising linear regression
install.packages("ggplot2")
library(ggplot2)
ggplot()+geom_point(aes(dataset$Level,dataset$Salary) ,color = 'red')+
  geom_line(aes(x = dataset$Level,y = predict(lin_reg, newdata = dataset)) ,color = 'blue')+
  ggtitle('truth or bluff (linearregression)')+xlab('level')+ylab('salary')


#visualising polynomial regression
ggplot()+geom_point(aes(dataset$Level,dataset$Salary) ,color = 'red')+
  geom_line(aes(x = dataset$Level,y = predict(poly_reg, newdata = dataset)) ,color = 'blue')+
  ggtitle('truth or bluff (linearregression)')+xlab('level')+ylab('salary')


#predicting the value using lineasr regression

y_pred = predict(lin_reg, newdata = data.frame(Level= 6.5))

#predicting the value using polynomial regression

y_pred2 = predict(poly_reg, newdata = data.frame(Level= 6.5 , Level2 = 6.5^2, Level3 = 6.5^3))
