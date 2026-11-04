# The Budget Illusion — CS215 Open Project (Team 05, IIT Bombay)

Analysis of 1,698 Bollywood films ([Mendeley Data, DOI 10.17632/3c57btcxy9.1](https://doi.org/10.17632/3c57btcxy9.1)).
Research question: after accounting for film **scale** (budget + screens), do holiday timing, franchise/remake
status, genre and crew novelty still explain box-office performance?

## Pipeline (run notebooks in this order)

| Notebook | Purpose |
|---|---|
| `1.CleanUp.ipynb` | Cleans `DataSet.csv` → `CleanedDataSet.csv` (bool flags, genre dummies, `ROI`, `Revenue Per Screen`, `Movie_Scale`) and verifies the output against the raw data |
| `2.EDA.ipynb` | EDA only: summary statistics, distributions, categorical composition, descriptive group comparisons (no tests), ROI by scale band |
| `3.DistributionFitting.ipynb` | Distribution fitting proofs: χ² contests (lognormal wins for revenue and ROI), MoM vs MLE, QQ luck-tube audit, bootstrap CIs |
| `4.LinearRegression.ipynb` | Regression only: log(ROI) response, scale-adjusted models, mediation, HC3 diagnostics, train/test validation |
| `5.HypothesisTesting.ipynb` | Hypothesis tests only: H1–H4 four-stage OLS ladders (HC3), permutation confirmation within scale bins, revenue concentration |

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
- Models explain **log(ROI)** — the near-normal scale validated in notebook 3 (R² 0.549 vs 0.371 for raw ROI);
  coefficients read as percentage effects. Scale absorbs most of the raw "safe bet" premiums
  (unadjusted → full): holiday **+0.28 → −0.02** (n.s.), franchise **+1.70 → +0.34** (≈ **+40%** ROI, survives),
  remake **+1.60 → +0.35** (≈ **+42%** ROI, survives).
- The genre effect is scoped to adult (≈ **+407%** ROI at comparable scale; horror ≈ **+55%** emerges); the
  drama / rom_com / documentary premiums appear only on raw ROI and dissolve on the validated scale.
- **49.6%** of budget's effect on revenue is mediated by screens (bootstrap 99% CI excludes 0).
- Revenue is extremely concentrated: star-level Gini **0.954**, top-10 stars hold **59.3%** of all revenue; star
  names add **+0.32** of explained variance to log(ROI) beyond scale bands.
