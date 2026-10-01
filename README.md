```markdown
# Morphometric Sex Classification & Comparative Machine Learning

## 🎯 Problem
In ecological and biological field research, determining animal sex from physical observation is often difficult or invasive. Relying on physical measurements (bill length, bill depth, flipper length, and body mass) requires quantitative models that accurately classify sex while handling feature scaling and multi-variable interactions.

## 💡 Solution & Technical Architecture
Built an end-to-end comparative machine learning pipeline in R using the Palmer Penguins dataset[cite: 1]. Evaluated and benchmarked three distinct classification algorithms—K-Nearest Neighbors (KNN), Classification Trees (CART), and Binomial Logistic Regression—to identify the optimal predictive model on holdout test partitions[cite: 1].

* **Language & Tools:** R, RStudio[cite: 1]
* **Libraries:** `class` (KNN), `rpart` & `rpart.plot` (Decision Trees), `ggplot2` (Data Visualization)[cite: 1]
* **Methodology:** Feature Engineering, Min-Max/Standardization Scaling, 70/30 Train/Test Partitioning, Statistical Diagnostic Testing[cite: 1]

## 🔬 Modeling Workflow
1. **Data Pre-processing:** Cleaned missing observations, encoded target categories, and normalized numerical traits (`bill_len`, `bill_dep`, `flipper_len`, `body_mass`) to prevent distance distortion in KNN calculations[cite: 1].
2. **K-Nearest Neighbors ($k=3$):** Applied Euclidean distance-based classification on standardized feature matrices[cite: 1].
3. **Decision Trees (CART):** Built recursive binary split trees (`rpart`) to extract human-readable decision rules based on primary physical markers[cite: 1].
4. **Logistic Regression (GLM):** Evaluated probabilistic log-odds boundaries, validating model performance using Chi-Square deviance and Wald tests[cite: 1].

## 📁 Repository Structure
```text
├── src/
│   └── penguin_classification.R   # Main pipeline script (cleaning, modeling, evaluation)
├── docs/
│   ├── decision_tree_plot.png     # Rendered CART model visualization
│   └── logistic_regression.png    # Probability curve plots
└── README.md                      # Project documentation
