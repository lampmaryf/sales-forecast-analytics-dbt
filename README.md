# Sales Forecast Analytics Pipeline (Snowflake + dbt)

## Overview

This project builds an analytics pipeline using **Snowflake** and **dbt** to transform raw sales data into an analytics-ready warehouse. The pipeline models sales data into a **star schema** consisting of dimension and fact tables, then products analytics models to analyze SKU-level demand behavior and volatility.

The project simulates a real-world forecasting and demand planning workflow where sales data must be organized and transformed before it can support forecasting models and operational analysis.

---

## Tools Used
```
- Snowflake (Cloud Data Warehouse)
- dbt (Data Transformation Framework)
- SQL
- Git / GitHub
- Power BI (used in related analytics project)
```
---

## Data Architecture

The pipeline follows a layered dbt modeling approach:
Raw Data → Staging → Dimensions / Fact → Intermediate Models → Analytics Models

## Data Flow
```
sales_forecast_raw
↓
stg_sales
↓
dim_product
dim_customer
dim_date
fct_sales
↓
int_sku_monthly_sales
↓
sku_volatility
```

---

## Data Models

### Staging Layer
**stg_sales**
```
-Cleans and standardizes raw sales data 
-Renames columns
-Prepares the dataset for downstream modeling
```
---

### Dimension Models
**dim_product**

Contains product-level attributes including:
```
-Bulk SKU
-Category
-Sub-category
-Current 9-box classification
```
**dim_customer**

Customer dimesion containing customer identifiers and attributes.

**dim_date**

Date dimension derived from order dates.

---

### Fact Model
**fct_sales**

Transaction-level fact table containing:
```
-Sales
-Profit
-Discount
-Quantity
```
This table links to all dimension models.

---

### Intermediate Model
**int_sku_monthly_sales**

Aggregates transaction-level data into **monthly SKU sales totals**.

---

### Analytics Model
**sku_volatility**

Calculates SKU-level demand variability metrics including:
```
-Average monthly sales
-Standard deviation
-Coefficient of variation
```
These metrics can support **inventory segmentation and forecasting analysis**.

---

## Data Quality

Data quality is enforeced using dbt tests:
```
-'unique' tests on dimension keys
-'not_null' tests on required fields
```
---

## Project Structure

```
models/
  staging/
    stg_sales.sql

marts/
  dim_product.sql
  dim_customer.sql
  dim_date.sql
  fct_sales.sql

analytics/
  int_sku_monthly_sales.sql
  sku_volatility.sql

models/schema.yml
dbt_project.yml
README.md
```

---

## Business Use Case

The project demonstrates how sales data can be transformed into a structured warehouse that supports **forecasting analysis and demand variability measurement** at the SKU level.

This type of modeling is commonly used in supply chain analytics and demand planning workflows.
