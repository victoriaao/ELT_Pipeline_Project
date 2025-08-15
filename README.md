# ELT_Pipeline_Project


### dbt Marketing Analytics Project

This project builds a modern data pipeline for marketing analytics using **dbt Cloud**, **Snowflake**, and **Airbyte**. It transforms raw marketing data into clean, reliable, and analytics-ready models following a **Raw → Transform → Consumption** architecture.

---

## 🚀 Overview

- **Source Systems**: PostgreSQL (extracted via Airbyte)
- **Data Warehouse**: Snowflake
- **Transformation Tool**: dbt Cloud
- **Version Control**: GitHub

---

## 📂 Project Structure

```text
├── models/
│   ├── raw/              # References to raw Airbyte tables
│   ├── transform/        # Cleaned and standardized trs_ models
│   ├── consumption/      # Final fact and dimension models for reporting
│   └── marts/            # (Optional) Output layer for BI tools
│
├── seeds/                # Seed files if applicable
├── snapshots/            # Snapshots (not used in this project yet)
├── tests/                # Custom dbt tests
├── macros/               # Custom macros
├── dbt_project.yml       # Project config
└── README.md             # This file
```

---

## 📊 Data Sources

This project uses six core raw tables ingested via Airbyte:

| Table               | Description                            |
|---------------------|----------------------------------------|
| `campaigns`         | Campaign metadata                      |
| `campaign_performance` | Daily performance metrics           |
| `channels`          | Marketing channels used                |
| `email_campaigns`   | Email performance and engagement       |
| `email_lists`       | Email list definitions                 |
| `subscribers`       | Subscriber demographics & behaviors    |

---

## 🛠️ dbt Layers

### 🔹 Raw Layer
- Data is loaded via Airbyte into Snowflake's `raw` schema
- No transformation is done here — only source declarations

### 🔹 Transform Layer (`trs_`)
- Cleans and standardizes the raw data
- Handles type casting, deduplication, formatting, and basic validations
- Each file is named `trs_<table>.sql`

### 🔹 Consumption Layer
- Final models structured for reporting
- Includes fact and dimension tables
- Designed to be consumed by BI tools or data apps

---

## ✅ Best Practices Followed

- Clear folder structure (raw → transform → consumption)
- All models are version-controlled via GitHub
- Jinja templates used for modularity and consistency
- `schema.yml` tests for:
  - `not_null`
  - `unique`
  - `relationships`
  - Expression-based validations (e.g., `open_count <= sent_count`)
- Audit columns (`date_loaded`) added in the transform layer
- All text fields are trimmed and formatted

---

## 📦 Packages Used

```yml
packages:
  - package: dbt-labs/dbt_utils
    version: 1.1.1
```

Install with:

```bash
dbt deps
```

---

## 🔬 How to Test

Run all data quality tests:

```bash
dbt test
```

---

## 🧪 Sample Tests

- `not_null` on all primary keys
- `unique` keys in dimensions
- Expression: `open_count <= sent_count`
- Relationship: `campaign_performance.campaign_id` → `campaigns.campaign_id`

---

## ⚙️ How to Run Models

Run everything:

```bash
dbt run
```

Run only the transform layer:

```bash
dbt run --select transform
```

---

## 🔍 Lineage & Docs

Generate documentation:

```bash
dbt docs generate
```

View docs:

```bash
dbt docs serve
```

---

## 🧠 Future Improvements

- Add snapshots for slowly changing dimensions
- Implement incremental models for large fact tables
- Add CI/CD via dbt Cloud or GitHub Actions

---

## 📝 Author

Co-lead Analytics Engineer: [Victoria Olorunfemi]  

