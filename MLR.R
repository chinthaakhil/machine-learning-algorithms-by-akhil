dataset= read.csv(file.choose())
summary(dataset)
dataset$State =factor(dataset$State,levels = c('California','Florida','New York'), labels = c(2,3,1))
install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit , SplitRatio = 0.8)
training_set = subset(dataset ,split == TRUE)
test_set = subset(dataset , split == FALSE)

# fitting the regression model

regressor = lm( formula = Profit ~ . ,data = training_set)

summary(regressor)

y_pred = predict(regressor , newdata = test_set)
y_pred


#FINDING THE OPTIMAL MODEL
regressor = lm(formula = Profit ~ . , data = dataset)

