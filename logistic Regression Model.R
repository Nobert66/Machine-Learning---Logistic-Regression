#Loading Necessary packages 
library(Boruta) 
library(caret) 
library(caTools) 
library(tidyverse) 
library(pROC) 
library(dplyr)

#Loading dataset.
data <- read_csv("C:/Users/Nobert Wafula/Desktop/heart-disease.csv")

#Assess the data structure.
glimpse(data)

#Data inspection.
anyNA(data)
sum(duplicated(data))

#Data Preparation.
data <- data %>% distinct()

#Converting categorical variables into factor 
categorical_vars <- c("sex", "cp", "fbs", "restecg", "exang", "slope", "ca", 
                      "thal", "target") 
data[categorical_vars] <- lapply(data[categorical_vars], as.factor) 

#Renaming the varibles 
data = data %>% rename("chest.pain" = cp, 
                       "resting.blood.pressure" = trestbps, 
                       "cholesterol" = chol, 
                       "fasting.blood.sugar" = fbs, 
                       "Resting.electrocardiographic.results" = restecg, 
                       "Maximum.heart.rate" = thalach, 
                       "Exercise.induced.angina" = exang, 
                       "ST.depression.induced.by.exercise.relative.to.rest" = 
                         oldpeak, 
                       "Slope.of.the.peak.exercise.ST.segment" = slope, 
                       "Number.of.major.vessels" = ca, 
                       "Thalassemia" = thal) 

#Checking the outcome’s observations from binary 
data$target = ifelse(data$target == 0, "No", 
                     "Yes") 
#Checking the distribution of the study outcome. 
table(data$target)

#Handling Class Imbalance 
data$target = as.factor(data$target) 

#Apply the upsampling for manority class 
data <- upSample(x = data[, -14], 
                 y = data$target) 
table(data$Class) 

#Feature Importance Analysis 
boruta_results = Boruta(Class~., data) 
print(boruta_results) 

#Remove unimportant variables.
data$fasting.blood.sugar <- NULL
data$Resting.electrocardiographic.results <- NULL

#To check only the confirmed attributes 
getSelectedAttributes(boruta_results, withTentative = TRUE) 

#Splitting the data into training and testing. 
index = sample.split(data$Class,SplitRatio = 0.8) 

trainData = subset(data, index == "TRUE")

testData = subset(data, index == "FALSE") 

table(trainData$Class) 

#Prepare a training scheme 
fitcontrol = trainControl(method = "repeatedcv",  
                          number = 10, 
                          repeats = 3, 
                          classProbs = TRUE, 
                          summaryFunction = twoClassSummary) 

#Train the logistic regression model 
model = train(Class~., trainData,  
              method = "glm", 
              metric = "ROC", 
              preProcess = c("center","scale"), 
              trControl = fitcontrol)

print(model)

#Make predictions 
model_pred = predict(model, testData) 

#Creating Confusion Matrix 
cm = confusionMatrix(model_pred, testData$Class, positive = "Yes") 
cm

#The model achieved an accuracy of 77.27%, indicating good overall predictive performance.
#Sensitivity was high (87.88%), showing that the model is effective at correctly identifying patients with heart disease,
#which is critical in clinical diagnosis. Specificity was moderate (66.67%), 
#indicating some misclassification of healthy individuals as diseased. 
#The Kappa statistic (0.5455) suggests moderate agreement beyond chance. 
#Overall, the model performed significantly better than random classification (p < 0.001), 
#making it suitable for preliminary heart disease screening.

pred = predict(model, testData, 
               type = "prob") 

plot_roc <- roc(testData$Class, pred$Yes) 

#AUC = 0.9201 means:
#The model has excellent ability to separate:
#patients with heart disease (Yes)
#Patients without heart disease (No)
auc_value <- auc(plot_roc)

plot(plot_roc,
     col = "darkgreen",
     lwd = 3,
     main = paste("ROC Curve (AUC =", round(auc_value, 4), ")"))

abline(a = 0, b = 1, lty = 2, col = "red")

