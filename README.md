# Global SDGs & CO₂ Emissions Analysis

## Executive Summary

Sustainable development and climate action are among the most important global challenges facing governments and organizations today.

Using **SQL** and **PostgreSQL**, I analyzed over **20 years of sustainability, socio-economic, and environmental data** across three global datasets to identify which countries are leading or lagging in achieving the **United Nations Sustainable Development Goals (SDGs)**.

By building a relational database and performing cross-dataset analysis, I evaluated:

- SDG performance
- CO₂ emissions trends
- Renewable energy adoption
- Quality-of-life indicators

The analysis revealed strong regional patterns, highlighted countries making the greatest progress, and identified areas where climate action remains significantly behind global targets.

### Key Findings

- 🇫🇮 Finland ranked as the global SDG leader.
- 🇨🇳 China and 🇺🇸 the United States remain the largest CO₂ emitters.
- Renewable energy adoption shows a positive relationship with life expectancy.
- Several high-income fossil-fuel-dependent economies display significant climate action gaps.

---

## Key Business Impact

- Analyzed **22 years of sustainability data**
- Integrated **3 global datasets**
- Evaluated SDG performance for **190+ countries**
- Identified top and bottom-performing countries across multiple sustainability dimensions
- Revealed long-term trends in:
  - CO₂ emissions
  - Renewable energy adoption
  - SDG progress
- Generated actionable insights for policymakers, sustainability analysts, and researchers

---

## Business Problem

Governments, international organizations, and sustainability analysts need reliable ways to measure progress toward the **United Nations Sustainable Development Goals (SDGs)** while balancing economic development and environmental impact.

However, sustainability data is often fragmented across multiple sources, making it difficult to understand:

- Which countries perform best and worst on the SDGs
- How CO₂ emissions relate to sustainability outcomes
- Whether renewable energy adoption is associated with improved quality of life
- Which countries are making meaningful progress over time
- Where the largest climate action gaps still exist

### Project Objective

The objective of this project was to consolidate multiple sustainability datasets into a relational database and use SQL to uncover global trends and benchmark country performance.

---

## Methodology

### Data Preparation & Modeling

- Cleaned and standardized three independent datasets
- Harmonized country names and numeric formats
- Designed and implemented a PostgreSQL relational database

### Database Structure

The database consists of three relational tables:

| Table | Description |
|---------|------------|
| `country_2023` | Socio-economic and demographic indicators |
| `sustainable_energy` | Energy access, renewable energy usage, and CO₂ emissions |
| `sdg_index_2000_2022` | SDG Index scores and all 17 SDG goal scores |

### Analysis Performed

Using SQL, I analyzed:

- Global SDG rankings
- Country-level SDG progress over time
- CO₂ emissions trends
- Renewable energy adoption
- Electricity access rates
- Climate Action (Goal 13) performance
- Cross-dataset relationships between sustainability, emissions, and quality of life

---

## Skills & Technologies

**SQL & Database:** PostgreSQL, Complex Joins, Common Table Expressions (CTEs), Window Functions, Aggregate Functions, Ranking Functions, Relational Database Design

**Data Preparation:** Data Cleaning and Data Standardization with Google Sheets, Data Modeling, Cross-Dataset Integration

**Analytics:** Data Analysis, Trend Analysis, Time Series Analysis, Comparative Country Benchmarking, Sustainability Metrics Evaluation, Environmental Data Analysis

---

## Results & Business Recommendations

**SDG Performance:**
- **Finland leads globally** with an SDG score of 86.80 in 2022, followed by Sweden and Denmark, Nordic countries dominate the top rankings.
- **Germany** scores highest (83.40) among the world's largest CO₂ emitters; **India** scores lowest (63.40) in the same group.
- **Italy's SDG score** rose from 76.50 (2012) to 78.80 (2022), well above the global average of 67.37.
- Italy's **Goal 13 (Climate Action)** improved the most, from 76.20 to 79.90; **Goal 2 (Zero Hunger)** showed the least progress (69.50 → 69.80).

**CO₂ Emissions:**
- **China and the United States** are the largest CO₂ emitters by far; **India and Russia** follow with emissions exceeding 1 million kilotons.
- The same top 5 (China, USA, India, Japan, Germany) held their positions consistently from **2016 to 2019**.
- Global CO₂ emissions trended upward from 2009 to 2019, peaking in **2013**, dipping until 2016, then rising again.

**Renewable Energy & Quality of Life:**
- **Iceland** leads renewable energy use at 80.1% with a life expectancy of 82.7 years; **Norway** follows at 67.1% and 82.8 years.
- Countries with the lowest electricity access in 2020 are concentrated in **Sub-Saharan Africa**: South Sudan and Chad at ~10%, Mozambique at 30.60%.

**Climate Action Gaps:**
- **Qatar scores 0.00** on Goal 13 (Climate Action) in 2022 (the worst globally) followed by Brunei (1.30) and UAE (9.80), all fossil-fuel-rich nations.
- All bottom-10 SDG countries score **0 for Goal 1 (Poverty)**, indicating systemic crises concentrated in fragile states.

---

## Recommendations

Based on the findings, policymakers and sustainability organizations should:

1. Accelerate investments in renewable energy infrastructure.
2. Prioritize electricity access programs in underserved regions.
3. Develop targeted climate action initiatives in high-emission economies.
4. Monitor SDG performance through integrated sustainability dashboards.
5. Benchmark against top-performing countries to identify effective policy strategies.


### Key Insight

Strong sustainability performance is often associated with:

- Diversified energy systems
- High-quality public services
- Long-term environmental policy commitments

---

## Next Steps

Future enhancements to this project include:

- Performing correlation and regression analysis between SDG performance and CO₂ emissions
- Forecasting future SDG and emissions trends using Python
- Developing a sustainability scoring framework to benchmark countries across multiple dimensions

---

## Datasets
- [Global Country Information Dataset 2023](https://www.kaggle.com/datasets/nelgiriyewithana/countries-of-the-world-2023)  
- [Global Data on Sustainable Energy](https://www.kaggle.com/datasets/anshtanwar/global-data-on-sustainable-energy)  
- [SDG Index 2000–2022](https://www.kaggle.com/datasets/sazidthe1/sustainable-development-report)  

---

## Files Included
| File | Description |
|------|-------------|
| `Global-SDGs-CO2-Emissions-Presentation.pdf` | Presentation summarizing methods, queries, and insights |
| `sql_script.sql` | SQL queries for table creation, data insertion, and all analyses |
| `README.md` | Project overview, methodology, and key insights |
