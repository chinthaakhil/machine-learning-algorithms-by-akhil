dataset = read.csv(file.choose())
 dataset = dataset[2:3]
 install.packages("e1071")
 library(e1071)
regressor = svm(formula = Salary ~ Level ,data = dataset ,type = 'eps-regression')
 ggplot()+geom_point(aes(dataset$Level , dataset$Salary ), color ='red')+
   geom_line(aes(dataset$Level, predict(regressor , newdata = dataset)),color='blue')+
   ggtitle('truth or bluff(svr)')+xlab('level')+ylab('salary')
 