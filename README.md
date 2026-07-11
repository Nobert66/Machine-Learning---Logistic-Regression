 
Machine-Learning---Logistic-Regression
A machine learning project that predicts heart disease using Logistic Regression in R. The workflow includes data preprocessing, feature selection with Boruta, class balancing, model training, cross-validation, and evaluation using a confusion matrix, ROC curve, and AUC.
![Uploading ChatGPT Image Jul 12, 2026, 12_53_57 AM.png…]()


# Project Overview

Heart disease remains one of the leading causes of illness and mortality worldwide, making early detection essential for improving patient outcomes and supporting clinical decision making. This project develops a binary classification model using Logistic Regression to predict whether a patient is likely to have heart disease based on clinical and demographic characteristics. Rather than serving as a replacement for medical diagnosis, the model is designed as a decision support tool that identifies patterns within patient data and estimates the probability of heart disease.

The project follows a complete end to end machine learning workflow implemented in R. It begins with data loading and exploratory inspection to understand the structure and quality of the dataset. Data preprocessing includes checking for missing values, identifying and removing duplicate observations, converting categorical variables into factors, renaming variables to improve readability, and transforming the target variable into meaningful class labels.

Since machine learning models are sensitive to class distribution, the dataset is evaluated for class imbalance. Upsampling is applied to create a balanced dataset, reducing the likelihood of bias toward the majority class and improving the model's ability to correctly classify both positive and negative cases.

Feature selection is performed using the Boruta algorithm, an all relevant feature selection method based on Random Forest. Boruta evaluates the contribution of each predictor by comparing its importance with randomized shadow features. This process identifies variables that significantly contribute to heart disease prediction while removing those with little predictive value. In this analysis, fasting blood sugar and resting electrocardiographic results were identified as having limited importance and excluded from the final model.

The prepared dataset is then divided into training and testing subsets, with 80 percent of the observations used for model training and the remaining 20 percent reserved for independent evaluation. Logistic Regression is trained using the caret package with repeated 10 fold cross validation. This resampling strategy improves model reliability by evaluating performance across multiple training and validation splits while reducing the risk of overfitting. Continuous predictors are centered and scaled during preprocessing to ensure consistent model estimation.

Model performance is assessed using multiple evaluation metrics rather than relying solely on accuracy. A confusion matrix is generated to measure accuracy, sensitivity, specificity, positive predictive value, negative predictive value, balanced accuracy, and Cohen's Kappa. These metrics provide a comprehensive assessment of how well the model distinguishes patients with heart disease from those without the condition.

The Receiver Operating Characteristic, ROC, curve is constructed to evaluate the model across different classification thresholds. The Area Under the ROC Curve, AUC, summarizes the model's discriminative ability. An AUC close to 1 indicates excellent performance, meaning the model effectively separates patients with heart disease from healthy individuals. 

Beyond model development, this project demonstrates essential machine learning practices including data cleaning, feature engineering, class balancing, feature selection, model validation, statistical evaluation, and result interpretation. The workflow provides a practical example of applying supervised machine learning techniques to healthcare data while emphasizing transparency, reproducibility, and interpretability. Although Logistic Regression is one of the simplest classification algorithms, its strong predictive performance and ease of interpretation make it well suited for clinical risk prediction problems where understanding the relationship between predictors and outcomes is as important as achieving high predictive accuracy.

# Technologies Used

This project was developed entirely in R and leverages a collection of specialized packages for data manipulation, machine learning, feature selection, model evaluation, and visualization. Each technology plays a specific role in building a complete and reproducible machine learning pipeline.

## Programming Language

### R

R is the primary programming language used throughout this project. It provides a comprehensive environment for statistical computing, data analysis, machine learning, and visualization, making it well suited for predictive healthcare analytics.

## Development Environment

### RStudio

RStudio was used as the integrated development environment (IDE) for writing, executing, debugging, and organizing the project code efficiently.

## Libraries and Packages

### tidyverse

Used for data manipulation, transformation, and cleaning. It provides powerful tools for importing datasets, modifying variables, filtering observations, and preparing the data for machine learning.

### dplyr

Used for data wrangling operations such as selecting variables, renaming columns, removing duplicate observations, and transforming the dataset into a format suitable for analysis.

### caTools

Used to split the dataset into training and testing sets while preserving the distribution of the target classes.

### caret

Serves as the core machine learning framework for the project. It was used to:

* Preprocess the data through centering and scaling.
* Perform repeated 10 fold cross validation.
* Train the Logistic Regression model.
* Handle class imbalance through upsampling.
* Generate predictions.
* Evaluate model performance using a confusion matrix.

### Boruta

Used for feature selection. Boruta identifies the most relevant predictors by comparing the importance of original variables against randomized shadow variables, helping remove features with little predictive value.

### pROC

Used to evaluate the classification model by generating the Receiver Operating Characteristic (ROC) curve and calculating the Area Under the Curve (AUC), providing insight into the model's discriminative performance.

## Machine Learning Algorithm

### Logistic Regression

A supervised machine learning algorithm used for binary classification. The model estimates the probability of heart disease based on patient characteristics and provides interpretable coefficients that describe the relationship between predictor variables and the outcome.

## Validation Technique

Repeated 10 Fold Cross Validation was used during model training to improve the reliability of performance estimates, reduce overfitting, and assess the model across multiple resampled datasets.

## Performance Evaluation

The trained model was evaluated using several classification metrics, including:

* Accuracy
* Sensitivity
* Specificity
* Cohen's Kappa
* Positive Predictive Value
* Negative Predictive Value
* Balanced Accuracy
* Receiver Operating Characteristic (ROC) Curve
* Area Under the Curve (AUC)

Together, these technologies form a complete machine learning workflow, from data preprocessing and feature selection to model development, validation, and performance assessment.
# Project Workflow

This project follows a structured end to end machine learning pipeline for predicting heart disease using Logistic Regression. Each stage is designed to improve data quality, build a reliable predictive model, and evaluate its performance using robust statistical metrics.

```text
Heart Disease Dataset
        │
        ▼
Data Loading
        │
        ▼
Data Inspection
        │
        ├── Check data structure
        ├── Check missing values
        └── Identify duplicate records
        │
        ▼
Data Preprocessing
        │
        ├── Remove duplicate observations
        ├── Convert categorical variables to factors
        ├── Rename variables
        └── Encode target variable
        │
        ▼
Class Imbalance Handling
        │
        └── Apply Upsampling
        │
        ▼
Feature Selection
        │
        └── Boruta Algorithm
        │
        ▼
Remove Unimportant Features
        │
        ▼
Train-Test Split
        │
        ├── 80% Training Data
        └── 20% Testing Data
        │
        ▼
Data Preprocessing for Model
        │
        ├── Center Numerical Variables
        └── Scale Numerical Variables
        │
        ▼
Model Training
        │
        └── Logistic Regression
        │
        ▼
Model Validation
        │
        └── Repeated 10 Fold Cross Validation
        │
        ▼
Prediction
        │
        └── Predict Heart Disease Status
        │
        ▼
Model Evaluation
        │
        ├── Confusion Matrix
        ├── Accuracy
        ├── Sensitivity
        ├── Specificity
        ├── Cohen's Kappa
        ├── Precision
        ├── Balanced Accuracy
        └── ROC Analysis
        │
        ▼
ROC Curve and AUC
        │
        ▼
Interpretation of Results
        │
        ▼
Final Machine Learning Model
```

## Workflow Description

The workflow begins by importing the heart disease dataset into R and performing an initial inspection to understand its structure, identify missing values, and detect duplicate observations. The dataset is then preprocessed by removing duplicate records, converting categorical variables into factors, renaming variables with descriptive names, and encoding the target variable into binary classes.

To address class imbalance, the minority class is upsampled, ensuring the model learns equally from both classes. Feature selection is then performed using the Boruta algorithm, which identifies the most informative predictors and removes variables with little contribution to the prediction task.

The processed dataset is divided into training and testing subsets using an 80:20 split. Before model fitting, numerical predictors are centered and scaled to standardize their values. A Logistic Regression model is trained using repeated 10 fold cross validation, providing a robust estimate of model performance while reducing the risk of overfitting.

The trained model generates predictions on the unseen testing dataset. Performance is evaluated using a confusion matrix and several classification metrics, including accuracy, sensitivity, specificity, precision, balanced accuracy, and Cohen's Kappa. Finally, the Receiver Operating Characteristic (ROC) curve and the Area Under the Curve (AUC) are used to assess the model's ability to distinguish between patients with and without heart disease. The resulting workflow produces an interpretable and reliable predictive model suitable for heart disease risk classification.

# Data Preprocessing

Data preprocessing is a critical stage in the machine learning pipeline because the quality of the input data directly influences model performance. Raw datasets often contain inconsistencies, duplicate records, incorrect data types, and other issues that reduce predictive accuracy. This project applies several preprocessing techniques to ensure the dataset is clean, consistent, and suitable for building a reliable Logistic Regression model.

## Data Inspection

The dataset was first imported into R using the `read_csv()` function from the tidyverse package. An initial inspection was performed to understand the structure of the data, identify the available variables, and verify their data types using the `glimpse()` function.

```r
glimpse(data)
```

The dataset contained 303 observations and 14 variables, including demographic information, clinical measurements, and a binary target variable indicating the presence or absence of heart disease.

## Missing Value Assessment

Missing values were examined to determine whether any observations required imputation or removal.

```r
anyNA(data)
```

The assessment confirmed that the dataset contained no missing values, allowing all observations to be retained for analysis.

## Duplicate Record Detection

Duplicate observations were identified to prevent repeated information from influencing model training.

```r
sum(duplicated(data))
```

One duplicate record was detected and removed using the `distinct()` function.

```r
data <- data %>% distinct()
```

Removing duplicate observations improves data quality and prevents certain records from having disproportionate influence during model training.

## Conversion of Categorical Variables

Several variables represented categorical information but were initially stored as numeric values. These variables were converted into factors to ensure they were treated as categorical predictors during model development.

The converted variables included:

* Sex
* Chest Pain Type
* Fasting Blood Sugar
* Resting Electrocardiographic Results
* Exercise Induced Angina
* ST Segment Slope
* Number of Major Vessels
* Thalassemia
* Target Variable

This conversion enables Logistic Regression to correctly estimate the effect of each category on the probability of heart disease.

## Variable Renaming

Several variable names in the original dataset were abbreviated, making interpretation difficult. The variables were renamed with descriptive labels to improve readability and facilitate interpretation throughout the analysis.

Examples include:

| Original Variable | Renamed Variable                                   |
| ----------------- | -------------------------------------------------- |
| cp                | chest.pain                                         |
| trestbps          | resting.blood.pressure                             |
| chol              | cholesterol                                        |
| fbs               | fasting.blood.sugar                                |
| restecg           | Resting.electrocardiographic.results               |
| thalach           | Maximum.heart.rate                                 |
| exang             | Exercise.induced.angina                            |
| oldpeak           | ST.depression.induced.by.exercise.relative.to.rest |
| slope             | Slope.of.the.peak.exercise.ST.segment              |
| ca                | Number.of.major.vessels                            |
| thal              | Thalassemia                                        |

Descriptive variable names improve code readability and make model outputs easier to understand.

## Target Variable Encoding

The original target variable was encoded using numerical values.

* 0 represented patients without heart disease.
* 1 represented patients with heart disease.

For improved interpretability, the values were converted into descriptive class labels.

* No
* Yes

The target variable was then converted into a factor because Logistic Regression requires categorical class labels for binary classification.

## Class Distribution Assessment

The distribution of the target variable was examined before model training.

| Class | Observations |
| ----- | -----------: |
| No    |          138 |
| Yes   |          164 |

Although the imbalance was moderate, the classes were not perfectly balanced. Class imbalance can bias predictive models toward the majority class and reduce the ability to correctly classify minority observations.

## Handling Class Imbalance

To improve classification performance, upsampling was applied using the `upSample()` function from the caret package.

Upsampling increases the number of observations in the minority class by duplicating existing samples until both classes contain an equal number of observations.

After upsampling, the class distribution became:

| Class | Observations |
| ----- | -----------: |
| No    |          164 |
| Yes   |          164 |

This balanced dataset reduces prediction bias and improves the model's ability to learn from both classes equally.

# Feature Selection

Feature selection is an important step in machine learning that identifies the most relevant predictor variables for building an accurate model. Removing irrelevant features helps reduce noise, improve model performance, and simplify interpretation.

## Boruta Feature Selection

This project used the Boruta algorithm to evaluate the importance of each predictor variable. Boruta compares the importance of the original features with randomized shadow features and classifies each variable as important, tentative, or unimportant.

The algorithm was implemented using the following code:

```r
boruta_results <- Boruta(Class ~ ., data)
```

After the analysis, Boruta identified most of the clinical variables as important predictors of heart disease. Fasting blood sugar was classified as unimportant, while cholesterol and resting electrocardiographic results were initially identified as tentative.

The selected features were obtained using:

```r
getSelectedAttributes(boruta_results, withTentative = TRUE)
```

## Feature Removal

Based on the feature selection results, variables with limited predictive value were removed before model training.

```r
data$fasting.blood.sugar <- NULL
data$Resting.electrocardiographic.results <- NULL
```

Removing these variables reduced unnecessary complexity while retaining the predictors that contributed most to heart disease prediction.

# Model Development

After data preprocessing and feature selection, a Logistic Regression model was developed to predict whether a patient has heart disease based on the selected clinical features. Logistic Regression was chosen because it is a widely used supervised machine learning algorithm for binary classification problems and provides interpretable results.

## Data Splitting

The dataset was divided into training and testing sets using an 80:20 ratio. The training set was used to build the model, while the testing set was reserved for evaluating its performance on unseen data.

## Model Training

The model was trained using the `caret` package with repeated 10 fold cross validation. This validation approach improves the reliability of the model by repeatedly evaluating its performance on different subsets of the training data, helping to reduce the risk of overfitting.

Before training, numerical variables were centered and scaled to ensure consistent model performance.

The Logistic Regression model was developed using the following code:

```r
model <- train(
  Class ~ .,
  data = trainData,
  method = "glm",
  metric = "ROC",
  preProcess = c("center", "scale"),
  trControl = fitcontrol
)
```

## Model Performance

The trained model achieved the following average performance during cross validation:

| Metric      | Value  |
| ----------- | ------ |
| ROC         | 0.9111 |
| Sensitivity | 0.8123 |
| Specificity | 0.8478 |

These results indicate that the Logistic Regression model learned meaningful patterns from the training data and demonstrated strong ability to distinguish between patients with and without heart disease.

# Model Performance

The performance of the Logistic Regression model was evaluated using the testing dataset. Several classification metrics were used to assess how well the model distinguished between patients with and without heart disease.

A confusion matrix was generated to compare the predicted classes with the actual classes. This provided a detailed assessment of the model's predictive accuracy and classification performance.

## Confusion Matrix Results

| Metric                    |  Value |
| ------------------------- | -----: |
| Accuracy                  | 86.36% |
| Sensitivity               | 90.91% |
| Specificity               | 81.82% |
| Positive Predictive Value | 83.33% |
| Negative Predictive Value | 90.00% |
| Balanced Accuracy         | 86.36% |
| Cohen's Kappa             | 0.7273 |

## ROC Curve and AUC

The Receiver Operating Characteristic (ROC) curve was used to evaluate the model's ability to distinguish between patients with and without heart disease across different classification thresholds.

The model achieved an Area Under the Curve (AUC) of **0.9201**, indicating excellent discriminative performance. An AUC above 0.90 suggests that the model is highly effective at correctly classifying positive and negative cases.

## Interpretation

The Logistic Regression model achieved an overall accuracy of **86.36%**, indicating strong predictive performance on the testing dataset. The high sensitivity of **90.91%** shows that the model was effective at identifying patients with heart disease, while the specificity of **81.82%** demonstrates good performance in correctly identifying patients without the disease.

The AUC of **0.9201** further confirms the model's excellent ability to distinguish between the two classes. Overall, the results indicate that the model provides reliable predictions and is well suited for heart disease risk classification.

# Confusion Matrix

A confusion matrix was used to evaluate the classification performance of the Logistic Regression model by comparing the predicted class labels with the actual class labels in the testing dataset. It provides a detailed summary of correct and incorrect predictions and forms the basis for calculating performance metrics such as accuracy, sensitivity, and specificity.

## Confusion Matrix

| Prediction | Actual: No | Actual: Yes |
| ---------- | ---------: | ----------: |
| **No**     |         27 |           3 |
| **Yes**    |          6 |          30 |

## Interpretation

The model correctly classified **27** patients who did not have heart disease (True Negatives) and **30** patients who had heart disease (True Positives). It incorrectly classified **6** healthy patients as having heart disease (False Positives) and **3** patients with heart disease as healthy (False Negatives).

These results indicate that the model performed well in identifying both positive and negative cases. The relatively low number of false negatives is particularly important in a healthcare setting because it reduces the likelihood of missing patients who have heart disease. Overall, the confusion matrix demonstrates that the Logistic Regression model provides reliable and accurate classifications.

# Receiver Operating Characteristic (ROC) Curve

The Receiver Operating Characteristic (ROC) curve was used to evaluate the classification performance of the Logistic Regression model across different probability thresholds. The ROC curve illustrates the trade off between the True Positive Rate (Sensitivity) and the False Positive Rate (1 − Specificity), providing a comprehensive measure of the model's ability to distinguish between patients with and without heart disease.

The ROC curve was generated using the predicted probabilities from the testing dataset with the `pROC` package in R.

```r id="az4p1c"
pred <- predict(model, testData, type = "prob")

plot_roc <- roc(testData$Class, pred$Yes)

auc_value <- auc(plot_roc)
```

## Area Under the Curve (AUC)

The model achieved an **AUC of 0.9201**.

An AUC value ranges from 0.5 to 1.0, where:

* **0.5** indicates no discriminative ability.
* **0.7 to 0.8** indicates acceptable performance.
* **0.8 to 0.9** indicates excellent performance.
* **Above 0.9** indicates outstanding discriminative ability.

An AUC of **0.9201** demonstrates that the Logistic Regression model has an outstanding ability to distinguish between patients with heart disease and those without the disease.

## Interpretation

The ROC analysis confirms the strong predictive performance of the Logistic Regression model. With an AUC of **0.9201**, the model accurately separates positive and negative cases across a wide range of classification thresholds. This result indicates that the model is reliable for heart disease risk prediction and supports its use as a decision support tool for identifying individuals who may require further clinical evaluation.

# Key Findings

The Logistic Regression model demonstrated strong performance in predicting heart disease using clinical and demographic data. Data preprocessing, feature selection, and class balancing contributed to building a reliable and accurate classification model.

The key findings from this project are:

* The dataset was successfully cleaned by removing duplicate records and converting categorical variables into the appropriate data types.
* Upsampling effectively balanced the target classes, reducing bias during model training.
* The Boruta algorithm identified the most important predictors, while variables with limited predictive value were removed.
* Logistic Regression achieved an overall classification accuracy of **86.36%** on the testing dataset.
* The model recorded a high sensitivity of **90.91%**, indicating excellent performance in identifying patients with heart disease.
* The specificity of **81.82%** showed that the model was also effective in identifying patients without heart disease.
* The ROC analysis produced an **AUC of 0.9201**, demonstrating outstanding ability to distinguish between positive and negative cases.
* The combination of feature selection, repeated 10 fold cross validation, and data preprocessing resulted in a robust and interpretable machine learning model.

Overall, the project demonstrates that Logistic Regression is an effective algorithm for heart disease prediction and provides a transparent and reliable approach for binary classification in healthcare applications.

# Project Structure

The repository is organized to separate the dataset, source code, generated outputs, and documentation. This structure improves readability, reproducibility, and ease of maintenance.

```text
Heart-Disease-Logistic-Regression/
│
├── data/
│   └── heart-disease.csv          # Dataset used for model development
│
├── scripts/
│   └── logistic_regression.R      # Complete R script
│
├── outputs/
│   ├── confusion_matrix.png       # Confusion matrix results
│   ├── roc_curve.png              # ROC curve
│   └── model_summary.txt          # Model output and performance metrics
│
├── README.md                      # Project documentation
│
├── LICENSE                        # Project license
│
└── .gitignore                     # Files ignored by Git
```

Each folder has a specific purpose:

* `data/` stores the dataset used in the project.
* `scripts/` contains the R code for data preprocessing, feature selection, model training, and evaluation.
* `outputs/` contains the generated results, including visualizations and model performance summaries.
* `README.md` provides an overview of the project, methodology, and findings.
* `LICENSE` defines the terms under which the project can be used and shared.
* `.gitignore` specifies files and folders that should not be tracked by Git.

**# Future Improvements

Although the Logistic Regression model achieved strong predictive performance, several enhancements could further improve the project and expand its practical applications.

Future improvements include:

* Compare the performance of Logistic Regression with other machine learning algorithms such as Random Forest, Decision Tree, Support Vector Machine, XGBoost, and Neural Networks.
* Perform hyperparameter tuning to optimize model performance.
* Apply additional feature engineering techniques to create more informative predictors.
* Evaluate the model using larger and more diverse heart disease datasets to improve generalizability.
* Perform external validation using independent datasets to assess model robustness.
* Investigate model interpretability techniques such as SHAP or LIME to explain individual predictions.
* Develop an interactive web application using R Shiny that allows users to enter patient information and receive real time heart disease predictions.
* Integrate the model into a clinical decision support system to assist healthcare professionals during patient risk assessment.

These improvements would strengthen the predictive capability of the model, enhance its interpretability, and increase its potential for real world healthcare applications.
**

Author

Nobert Wafula

BSc Epidemiology and Biostatistics

Data Analyst | Machine Learning Enthusiast | Statistical Programmer

GitHub: https://github.com/Nobert66
