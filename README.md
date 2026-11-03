# The Budget Illusion — CS215 Open Project (Team 05, IIT Bombay)

Analysis of 1,698 Bollywood films ([Mendeley Data, DOI 10.17632/3c57btcxy9.1](https://doi.org/10.17632/3c57btcxy9.1)).
Research question: after accounting for film **scale** (budget + screens), do holiday timing, franchise/remake
status, genre and crew novelty still explain box-office performance?

## Pipeline (run notebooks in this order)

| Notebook | Purpose |
|---|---|
| `1.CleanUp.ipynb` | Cleans `DataSet.csv` → `CleanedDataSet.csv` (bool flags, genre dummies, `ROI`, `Revenue Per Screen`, `Movie_Scale`) |
| `2.EDA.ipynb` | Summary statistics, histograms, group comparisons (franchise / remake / holiday), star & director counts |
| `3.DistributionFitting.ipynb` | χ² goodness-of-fit contest over six families (lognormal wins for revenue and ROI), MoM vs MLE, QQ + luck-tube audit, simulation CIs, per-budget-band permutation tests |
| `4.LinearRegression.ipynb` | Scale-adjusted ROI regressions, budget→screens→revenue mediation, winsorization + HC3 robust SEs, train/test validation |
| `5.HypothesisTesting.ipynb` | H1–H4 four-stage OLS ladders (raw → content → scale → full, HC3), Gini / top-10 revenue concentration, scale-adjusted star ranking |

## How to run

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
jupyter nbconvert --to notebook --inplace --execute 1.CleanUp.ipynb   # then 2..5 in order
make        # rebuilds proposal.pdf from latex/proposal.tex
```

Outputs: `CleanedDataSet.csv`, `histograms/*.png`, `proposal.pdf`.

## Key results (full detail in the notebooks)

- The typical film loses money: **72.1%** have ROI < 1; median ROI is 0.335.
- Scale explains most of the raw "safe bet" premiums (raw → scale-adjusted ROI, HC3): holiday **+0.23 → +0.06** (n.s.),
  franchise **+1.38 → +0.67** (survives), remake **+0.96 → +0.30** (survives, weaker).
- All verdicts re-confirmed on the log scale validated in notebook 3 (R² 0.371 → 0.549): franchise ≈ **+40%** and
  remake ≈ **+42%** ROI survive; the drama/rom_com/documentary premiums dissolve on that scale, scoping the genre
  effect to adult (≈ **+407%** ROI).
- **49.6%** of budget's effect on revenue is mediated by screens (bootstrap 99% CI excludes 0).
- Revenue is extremely concentrated: star-level Gini **0.954**, top-10 stars hold **59.3%** of all revenue.
