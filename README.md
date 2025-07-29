# 📈 BEKK-GARCH Portfolio Volatility Modeling

This repository presents a multivariate volatility analysis of three JSE-listed stocks — Capitec Bank (CPI.JO), Anglo American (AGL.JO), and Bid Corporation Ltd (BID.JO) — using the BEKK-GARCH(1,1) model. The goal is to quantify dynamic volatilities, covariances, and spillover effects across sectors from January 2020 to June 2025.

## content

-  Jupyter notebooks for data processing and modeling
-  CSV files with historical stock prices
-  Final PDF report 
- Risk__assignment.R — R script for BEKK-GARCH estimation using the MTS package
- `README.md` — Project overview and methodology

## 📊 Key Findings

- Volatility clustering is present in all three stocks, with Capitec showing the most extreme spikes.
- Statistically significant spillovers exist from Bid Corp to Capitec and from Capitec to Anglo American.
- Portfolio volatility is time-varying, with major spikes around macroeconomic events.
- BEKK-GARCH effectively captures interdependence and dynamic risk, though it has limitations in scalability and correlation modeling.

## 🧠 Methodology

- **Model**: BEKK-GARCH(1,1) using Maximum Likelihood Estimation
- **Tools**: Python (data prep), R (model estimation via `MTS::BEKK11`)
- **Data**: Daily adjusted close prices from Yahoo Finance (2020–2025)
- **Diagnostics**: ADF, Ljung-Box, ARCH-LM tests confirm stationarity and ARCH effects

## 📌 Interpretation Highlights

- Capitec volatility is highly persistent and influenced by Bid Corp shocks.
- Anglo American shows cyclical behavior tied to global commodity demand.
- Bid Corp is sensitive to supply chain disruptions and consumer demand cycles.
- Portfolio volatility spikes align with macroeconomic events and sector shocks.

## ⚠️ Limitations

- Computationally intensive for large portfolios
- Fixed spillover structure may miss time-varying relationships
- Does not capture dynamic correlations (consider DCC-GARCH for that)


## 👤 Author

**Orebotse Clifford Seitsang**  
BCom Honours in Quantitative Finance  
Focused on risk modeling,

## 👥 Contributors

This project was collaboratively developed by:

- **Eliot**
- **Jessica**
- **Tselane**
- **Clifford (Orebotse Seitsang)** — Lead on modeling, reporting, and repository setup


