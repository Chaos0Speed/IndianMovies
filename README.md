# IndianMovies : The Budget Illusion

### Group 05
| Roll No | Name |
| :--- | :--- |
| 25B0929 | Vangala Ajay Reddy |
| 25B0940 | Laxmi Bhargav Mende |
| 25B1029 | Rushmith Bandari |
| 25B1098 | Aryan Balabadrula |

### Reproducing
```bash
pip install -r requirements.txt
jupyter nbconvert --to notebook --execute --inplace 1.CleanUp.ipynb   # regenerates CleanedDataSet.csv
jupyter nbconvert --to notebook --execute --inplace 2.EDA.ipynb       # ...then 3, 4, 5 in order
jupyter nbconvert --to notebook --execute --inplace 6.Dashboard.ipynb # regenerates dashboard.html
make all                                                              # builds latex/proposal.pdf
```
Notebook 1 must run first; every later notebook reads the `CleanedDataSet.csv` it writes.


### Step 1: DataSet Cleaning (`1.CleanUp.ipynb`)
- Clean the dataset: drop duplicates, align every column to a proper numerical/boolean dtype for the linear regression, encode the Yes/No flags and genre dummies, and derive `Movie_Scale`, `Revenue Per Screen` and `ROI`.

### Step 2: EDA - Exploratory Data Analysis (`2.EDA.ipynb`)
- Analyse the dataset before the actual regression model to understand the data better and get insights on how to proceed forward.

### Step 3: Linear Regression - Scale, Mediation and Validation (`3.LinearRegression.ipynb`)
- ROI regression with `Movie_Scale` band controls, winsorized-ROI sensitivity check
- Mediation analysis: ~50% of budget's effect on revenue flows through screens
- Diagnostics (Breusch-Pagan, HC3 robust errors, VIF) and an 80/20 train/test validation

### Step 4: Hypothesis Testing H1-H4 (`4.HypothesisTesting.ipynb`)
- Scale-stratified permutation tests with effect sizes and bootstrap CIs
- Implications are printed immediately after every result
- Holm-Bonferroni correction across the full family of tests
- H3 (IMDb ratings) is untestable with the current dataset - no ratings column; the notebook auto-runs once `imdb_ratings.csv` is provided

### Step 5: Distribution Fitting (`5.DistributionFitting.ipynb`)
- MLE and method-of-moments fits for ROI (Gamma wins) and revenue (log-normal)
- AIC/BIC/KS comparison, bootstrap parameter SEs and confidence intervals
- Permutation test for ROI gaps across budget bands

### Step 6: Interactive Dashboard (`6.Dashboard.ipynb` -> `dashboard.html`)
- Plotly dashboard with the distributions, scale effect, hypothesis scoreboard and Lorenz curves
- Regenerate by running the notebook top-to-bottom after any upstream change
