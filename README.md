# Morphometric Sex Classification & Comparative Machine Learning

## 🎯 Problem
In wildlife ecology, determining animal sex from field observation is often difficult, subjective, or invasive. Developing automated statistical classifiers based on physical measurements (bill length, bill depth, flipper length, and body mass) allows researchers to predict target variables accurately while identifying key biological markers.

## 💡 Solution & Technical Architecture
Built an end-to-end comparative machine learning pipeline in R using the Palmer Penguins dataset. Evaluated and benchmarked three distinct classification algorithms—K-Nearest Neighbors (KNN), Decision Trees (CART), and Binomial Logistic Regression—to identify the optimal predictive model on holdout test partitions.

* **Language & Environment:** R, RStudio[cite: 1]
* **Libraries:** `class` (KNN), `rpart` & `rpart.plot` (Decision Trees), `ggplot2` (Visualization)[cite: 1]
* **Core Methodology:** Data Pre-processing, Feature Standardization (`scale`), Train/Test Splitting (70/30), Diagnostic Validation[cite: 1]

## 🛠️ Modeling & Analytical Workflow
* **Feature Standardization & Scaling:** Standardized numeric traits (`scale()`) prior to distance calculations to prevent high-magnitude variables like `body_mass` from overwhelming Euclidean distance measurements in KNN[cite: 1].
* **K-Nearest Neighbors ($k=3$):** Constructed distance-based classification bounds on scaled 70/30 training and holdout test partitions[cite: 1].
* **Classification Trees (CART):** Built recursive binary partitioning models (`rpart`) to derive human-readable decision rules and visual classification paths[cite: 1].
* **Logistic Regression & Diagnostics:** Fitted parametric probabilistic models (`glm`), validating feature significance with Chi-Square deviance and Wald hypothesis tests[cite: 1].
* **Model Evaluation Suite:** Automated comparative confusion matrices to measure holdout error rates across all three algorithms[cite: 1].

## 📁 Repository Structure
```text
├── src/
│   └── penguin_classification.R   # Core R pipeline (cleaning, scaling, modeling)
├── docs/
│   ├── decision_tree_plot.png     # Exported CART visualization
│   └── logistic_regression.png    # Fitted probability curves
└── README.md                      # Case study documentation
