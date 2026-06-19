# Flipkart Product Price Intelligence Dashboard

> **End-to-End Data Analysis Project** | Python · PostgreSQL · Power BI

A complete data analysis pipeline built on Flipkart's e-commerce dataset covering **19,922 products** across **7 months (Dec 2015 – Jun 2016)**. The project uncovers pricing strategies, discount patterns, and category-level insights through a professional Power BI dashboard.

---

## Project Overview

**Business Question:** How does Flipkart price and discount products across categories, price tiers, and time? Are FK Advantage products truly premium?

**Goal:** Clean raw e-commerce data, engineer meaningful KPI features, and build a one-page executive dashboard that answers pricing questions in under 30 seconds.

---

## Pipeline Architecture

```
Raw CSV (Flipkart)
      │
      ▼
    Excel          ← Basic structural cleanup, null identification
      │
      ▼
 Python (Jupyter)       ← Data cleaning, feature engineering, EDA
      │
      ▼
 PostgreSQL             ← Business queries, KPI validation
      │
      ▼
 Power BI Dashboard     ← One-page interactive executive report
```

---



## Key Insights

### 💰 Discount Analysis
- **Average discount across all products: 40.5%** — Flipkart heavily incentivizes purchasing through discounting
- **Maximum discount recorded: 96.5%** — extreme outlier products with near-zero selling prices
- **Discount is trending upward** — grew from 37.6% in April 2016 to **44.2% in June 2016** (+17.6% in 2 months)
- **2,287 products (11.5%) have zero discount** — full price items mostly in Jewellery and Automotive

### 📦 Category Performance
- **Clothing dominates the catalog** — 6,171 products (31% of total), avg discount 45.1%
- **Automotive has the highest avg discount** — 54.7%, signaling aggressive competition in that space
- **Mobiles & Accessories** — 51% avg discount, second most discounted category
- **Footwear is the most conservative** — only 36.3% avg discount despite high product volume

### 🏷️ Price Tier Distribution
- **Budget products (under ₹500): 47.1%** of catalog — Flipkart skews heavily toward affordable products
- **Mid-Range (₹500–₹5,000): 47.5%** — nearly equal split between budget and mid-range
- **Premium (above ₹5,000): only 5.4%** — premium segment is a small but high-value niche

### ⚡ FK Advantage vs Standard Products
- **FK Advantage products are priced LOWER** — avg ₹1,774 vs ₹3,027 for Standard products
- **FK Advantage products are discounted LESS** — 28.1% vs 41.0% for Standard
- This reveals that FK Advantage is NOT a premium price tier — it is a **seller quality program**, not a pricing strategy

### 📈 Monthly Trends
| Month | Avg Discount % | Products Listed | Trend |
|---|---|---|---|
| Dec 2015 | 41.8% | 10,268 | Baseline |
| Jan 2016 | 37.5% | 4,835 | ▼ Down |
| Feb 2016 | 37.9% | 244 | ▲ Up |
| Mar 2016 | 40.8% | 1,629 | ▲ Up |
| Apr 2016 | 37.6% | 1,133 | ▼ Down |
| May 2016 | 41.7% | 770 | ▲ Up |
| Jun 2016 | **44.2%** | 1,043 | ▲ Up |

- **December 2015 anomaly** — 10,268 products in one month suggests a major catalog upload event or sale season (likely winter sale)
- **June 2016 discount peak** — highest discount month in the dataset, indicating mid-year sale strategy

### 💵 Customer Savings
- **Total customer savings across dataset: ₹2,00,37,634** (~₹2 Crore)
- Average customer saves **₹1,005 per product** on retail price
- Savings are concentrated in Clothing and Jewellery categories

---

## Dashboard Preview

[Dashboard PDF Report](dashboard image.pdf)

## Tools & Technologies

| Tool | Purpose |
|---|---|
| **Excel** | Basic data intake, null identification, structural cleanup |
| **Python (Pandas, NumPy, Matplotlib)** | Data cleaning, feature engineering, EDA visualizations |
| **Jupyter Notebook** | Interactive analysis environment |
| **PostgreSQL** | Business SQL queries, KPI validation |
| **Power BI Desktop** | Interactive one-page dashboard |
| **DAX** | KPI measures, target calculations, trend indicators |

---

## Project Structure

```
flipkart-price-analysis/
│
├── dataset/
│   ├── flipkart_com-ecommerce_sample.csv    ← Raw dataset
│   └── flipkart_cleaned.csv                 ← Cleaned & engineered dataset
│
├── notebook file/
│  └── flipkart_price_analysis.ipynb
|  └── flipkart_eda_report.png       ← EDA visualization report
│
├── sql file/
│   └── flipkart_sql_queries.sql             ←  PostgreSQL business queries
│
├──power bi dashboard /
│   └── flipkart_dashboard.pbix              ← Power BI dashboard file & image
|
└── README.md
```


## Learnings

**Technical skills demonstrated:**
- Real-world data cleaning — handling nested JSON strings, type mismatches, fake brand values
- Feature engineering — computing KPIs from raw columns (discount %, price tiers, trend flags)
- DAX measures for KPI targets and trend indicators in Power BI
- PostgreSQL business queries with GROUP BY, HAVING, subqueries, CASE statements
- One-page dashboard design following executive reporting standards

**Business understanding demonstrated:**
- Identified FK Advantage as a seller quality program, not a pricing premium
- Detected December 2015 as an anomaly month (bulk catalog upload)
- Showed that Automotive and Mobiles are more aggressively discounted than high-volume Clothing
- Proved that Flipkart's discount strategy is intensifying over time (trend upward)

---

## Author

**[Akansha Verma]**  
Aspiring Data Analyst | Python · SQL · Power BI 
