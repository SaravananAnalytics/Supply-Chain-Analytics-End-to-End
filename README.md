# 🚚 Supply Chain & Manufacturing Analytics Platform

> **> **Designed and developed an end-to-end Supply Chain & Manufacturing Analytics platform using Databricks, dbt, Python, SQL, Power BI, and VS Code to transform raw operational data into trusted analytical datasets, monitor critical supply chain KPIs, identify supplier and logistics bottlenecks, analyze inventory and production performance, and deliver actionable insights through interactive Power BI dashboards and executive reporting.**
**

---

## 📌 Project Overview

A manufacturing organization was experiencing increasing logistics costs, supplier delivery delays, inventory stock-outs, and production downtime.

This project develops an end-to-end **Supply Chain & Manufacturing Analytics Platform** to provide centralized visibility across:

* Procurement
* Inventory
* Production
* Logistics
* Sales & Demand

The solution transforms raw operational data into structured analytical datasets and interactive Power BI dashboards, enabling stakeholders to monitor operational performance, identify supply chain bottlenecks, and make data-driven decisions.

---

## 🎯 Business Objectives

The platform focuses on four major business objectives:

### 📦 Inventory Optimization

* Monitor inventory levels and stock-outs
* Identify SKUs approaching reorder thresholds
* Analyze inventory turnover
* Compare historical demand with available inventory

### 🤝 Supplier Performance

* Measure supplier delivery performance
* Identify suppliers with recurring delivery delays
* Analyze supplier lead-time variability
* Compare supplier performance across time periods

### 🚚 Logistics Optimization

* Track shipment costs
* Analyze transportation modes
* Monitor shipment delays
* Identify major logistics cost drivers

### 🏭 Production Efficiency

* Monitor production output
* Analyze production downtime
* Identify major downtime reasons
* Understand the relationship between supply chain delays and production disruptions

---

# 🏗️ Solution Architecture

```text
                    ┌─────────────────────┐
                    │     RAW CSV DATA    │
                    │                     │
                    │ Suppliers           │
                    │ Purchase Orders     │
                    │ Inventory           │
                    │ Production          │
                    │ Logistics           │
                    │ Sales Forecast      │
                    │ Calendar            │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      DATABRICKS     │
                    │                     │
                    │ Data Ingestion      │
                    │ Data Cleaning       │
                    │ Transformation      │
                    │ Validation          │
                    │ KPI Preparation     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │        dbt          │
                    │                     │
                    │ Staging Models      │
                    │ Dimension Models    │
                    │ Fact Models         │
                    │ Analytical Models   │
                    │ Data Tests          │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   ANALYTICS LAYER   │
                    │                     │
                    │ Cleaned Tables      │
                    │ Business KPIs       │
                    │ Analytical Views    │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      POWER BI      │
                    │                     │
                    │ Executive Dashboard │
                    │ Supplier Analytics  │
                    │ Inventory Analytics │
                    │ Logistics Analytics │
                    │ Production Analytics│
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   BUSINESS USERS   │
                    │                     │
                    │ Insights            │
                    │ KPI Monitoring      │
                    │ Root Cause Analysis │
                    │ Decision Support    │
                    └─────────────────────┘
```

---

# 🛠️ Technology Stack

| Technology     | Purpose                                                     |
| -------------- | ----------------------------------------------------------- |
| **Databricks** | Data processing, transformation, SQL/PySpark analytics      |
| **dbt**        | Data modelling, transformation, testing, and documentation  |
| **Python**     | Data analysis, validation, statistical analysis, automation |
| **SQL**        | Data transformation and analytical queries                  |
| **Power BI**   | Interactive dashboards and business intelligence            |
| **DAX**        | KPI calculations and analytical measures                    |
| **VS Code**    | Development environment for SQL, Python, and dbt            |
| **PowerPoint** | Business presentation and executive storytelling            |

---

# 📂 Dataset

The project uses historical operational data covering **2019–2024**.

### Source Tables

| Dataset               | Description                                                            |
| --------------------- | ---------------------------------------------------------------------- |
| `suppliers.csv`       | Supplier information, regions, and ratings                             |
| `purchase_orders.csv` | Purchase orders, quantities, promised dates, and actual delivery dates |
| `inventory.csv`       | SKU inventory levels, warehouse locations, and reorder thresholds      |
| `production.csv`      | Production output, downtime hours, and downtime reasons                |
| `logistics.csv`       | Shipment costs, transport modes, and transit delays                    |
| `sales_forecast.csv`  | Historical demand and forecasted demand                                |
| `calendar.csv`        | Centralized date dimension                                             |

---

# 🗄️ Data Modelling

The project follows a **star schema** to support efficient supply chain reporting.

## Dimension Tables

```text
dim_date
dim_supplier
dim_product
dim_warehouse
dim_transport_mode
```

## Fact Tables

```text
fact_purchase_orders
fact_inventory
fact_production
fact_logistics
fact_sales_forecast
```

### Data Model

```text
                     dim_supplier
                          │
                          ▼
                  fact_purchase_orders
                          │
                          │
dim_date ─────────────────┼──────────────── dim_product
                          │
                          ▼
                   Analytics Layer
                          │
             ┌────────────┼────────────┐
             ▼            ▼            ▼
        Inventory     Production    Logistics
```

---

# 🔄 Project Workflow

## Phase 1 — Data Ingestion

Raw CSV files were ingested into the analytics environment through **Databricks**.

### Activities

* Loaded raw datasets
* Inspected schema and data types
* Identified missing values
* Checked duplicate records
* Validated date fields
* Performed initial data profiling

---

# Phase 2 — Data Cleaning & Transformation

Data transformation was performed using **Databricks, SQL, Python, and dbt**.

### Data Quality Activities

* Missing-value handling
* Duplicate removal
* Data-type standardization
* Date standardization
* Invalid record detection
* SKU standardization
* Supplier standardization
* Delivery-date validation
* Cost validation

### Example Transformations

```text
Purchase Order
       ↓
Delivery Delay
       ↓
Supplier Performance
       ↓
On-Time Delivery %
       ↓
Supplier Analytics
```

---

# Phase 3 — dbt Data Modelling

**dbt** was used to organize transformation logic into reusable and maintainable models.

### dbt Layers

```text
Raw Data
   │
   ▼
Staging Models
   │
   ▼
Intermediate Models
   │
   ▼
Dimension / Fact Models
   │
   ▼
Analytics Models
```

### Example dbt Structure

```text
dbt_project/
│
├── models/
│   ├── staging/
│   │   ├── stg_suppliers.sql
│   │   ├── stg_purchase_orders.sql
│   │   ├── stg_inventory.sql
│   │   ├── stg_production.sql
│   │   └── stg_logistics.sql
│   │
│   ├── intermediate/
│   │   ├── int_supplier_performance.sql
│   │   ├── int_inventory_metrics.sql
│   │   └── int_logistics_metrics.sql
│   │
│   └── marts/
│       ├── fact_purchase_orders.sql
│       ├── fact_inventory.sql
│       ├── fact_production.sql
│       ├── fact_logistics.sql
│       └── fact_sales_forecast.sql
│
├── tests/
├── macros/
└── dbt_project.yml
```

---

# 📊 Phase 4 — Supply Chain KPI Development

The project calculates key operational KPIs across procurement, inventory, logistics, and production.

## Procurement KPIs

* Total Purchase Orders
* On-Time Delivery %
* Average Delivery Delay
* Supplier Lead Time
* Supplier Delivery Performance

## Inventory KPIs

* Total Inventory
* Inventory Turnover
* Stock-Out Rate
* Reorder Threshold Breaches
* SKU-Level Inventory

## Logistics KPIs

* Total Logistics Cost
* Average Shipment Cost
* Shipment Delay
* Cost by Transport Mode
* Monthly Logistics Cost

## Production KPIs

* Total Production Output
* Total Downtime Hours
* Downtime Ratio
* Downtime by Reason
* Monthly Production Performance

---

# 🔍 Phase 5 — SQL Analytics

Advanced SQL was used to identify operational bottlenecks and generate business insights.

### SQL Techniques

* CTEs
* Window Functions
* Ranking
* Aggregations
* CASE statements
* Subqueries
* Date functions
* Complex joins

### Key Analyses

#### Supplier Analysis

* Average delivery delay by supplier
* Supplier on-time delivery %
* Monthly supplier performance
* Top delayed suppliers
* Supplier dependency analysis

#### Inventory Analysis

* Stock-out frequency
* Inventory turnover
* Reorder threshold monitoring
* SKU-level inventory performance

#### Logistics Analysis

* Monthly logistics costs
* Average shipment cost by transport mode
* Shipment delay analysis
* Cost trends over time

#### Production Analysis

* Production downtime trends
* Downtime by reason
* Production output trends
* Supply-chain delay impact on production

---

# 🐍 Phase 6 — Python Analysis

Python was used for data exploration, validation, and statistical analysis.

### Libraries

```text
Pandas
NumPy
Matplotlib
Seaborn
Statsmodels
```

### Analysis Performed

* Exploratory Data Analysis
* Distribution analysis
* Correlation analysis
* Trend analysis
* Outlier detection
* Data quality validation
* KPI validation

---

# 📈 Phase 7 — Power BI Dashboard

Power BI was used to convert the transformed datasets into interactive business dashboards.

## Dashboard 1 — Executive Overview

### KPIs

```text
Total Purchase Orders
On-Time Delivery %
Average Delivery Delay
Total Logistics Cost
Inventory Level
Stock-Out Rate
Production Output
Downtime Hours
```

### Visuals

* KPI cards
* Monthly trends
* Supplier performance
* Logistics cost trends
* Inventory overview
* Production performance

---

## Dashboard 2 — Supplier Performance

### Analysis

* Supplier-wise delivery delays
* On-Time Delivery %
* Average supplier lead time
* Monthly supplier trends
* Supplier dependency
* Delayed supplier identification

### Drill-Through

```text
Supplier
   ↓
Purchase Orders
   ↓
Individual Delivery Performance
```

---

## Dashboard 3 — Inventory Analytics

### Analysis

* Inventory levels
* Stock-out trends
* SKU performance
* Reorder threshold monitoring
* Historical demand
* Inventory turnover

### Drill-Through

```text
SKU
 ↓
Warehouse
 ↓
Inventory Position
 ↓
Historical Demand
```

---

## Dashboard 4 — Logistics Analytics

### Analysis

* Total logistics cost
* Monthly logistics trends
* Cost by transport mode
* Shipment delays
* Average shipment cost
* Rolling 3-month logistics cost

---

## Dashboard 5 — Production Analytics

### Analysis

* Production output
* Downtime hours
* Downtime reasons
* Monthly production trends
* Supplier delay vs production downtime

---

# 📐 Key DAX Measures

### On-Time Delivery %

```DAX
On-Time Delivery % =
DIVIDE(
    CALCULATE(
        COUNTROWS(fact_purchase_orders),
        fact_purchase_orders[delivery_delay_days] <= 0
    ),
    COUNTROWS(fact_purchase_orders)
)
```

### Average Delivery Delay

```DAX
Average Delivery Delay =
AVERAGE(
    fact_purchase_orders[delivery_delay_days]
)
```

### Total Logistics Cost

```DAX
Total Logistics Cost =
SUM(
    fact_logistics[shipment_cost]
)
```

### Total Production Downtime

```DAX
Total Downtime Hours =
SUM(
    fact_production[downtime_hours]
)
```

### Total Forecasted Demand

```DAX
Total Forecasted Demand =
SUM(
    fact_sales_forecast[forecasted_demand]
)
```

---

# 📊 Business Insights

The analysis supports data-driven decisions across the supply chain.

### Supplier Management

Identify suppliers with:

* High delivery delays
* Low on-time delivery rates
* High lead-time variability
* High dependency

### Inventory Management

Identify:

* High-risk SKUs
* Frequent stock-outs
* Slow-moving inventory
* Reorder threshold issues

### Logistics Management

Identify:

* High-cost transport modes
* Increasing logistics costs
* Shipment delay patterns
* Cost-intensive routes or shipments

### Production Management

Identify:

* Major downtime reasons
* Production disruption trends
* Periods of low production efficiency
* Potential relationships between supply delays and downtime

---

# 💼 Business Recommendations

Based on the analytical findings, the platform supports recommendations around:

### 🤝 Supplier Optimization

* Review consistently delayed suppliers
* Monitor supplier delivery KPIs
* Evaluate supplier dependency
* Support supplier performance discussions

### 📦 Inventory Optimization

* Review safety-stock levels
* Monitor reorder thresholds
* Prioritize frequently stocked-out SKUs
* Align inventory with historical demand patterns

### 🚚 Logistics Optimization

* Compare transportation modes
* Monitor high-cost shipments
* Investigate recurring shipment delays
* Track logistics cost trends

### 🏭 Production Optimization

* Monitor recurring downtime causes
* Identify production disruption patterns
* Improve production planning using demand trends
* Coordinate procurement and production planning

---

# 📁 Repository Structure

```text
supply-chain-manufacturing-analytics/
│
├── README.md
│
├── data/
│   ├── suppliers.csv
│   ├── purchase_orders.csv
│   ├── inventory.csv
│   ├── production.csv
│   ├── logistics.csv
│   ├── sales_forecast.csv
│   └── calendar.csv
│
├── dbt/
│   ├── models/
│   │   ├── staging/
│   │   ├── intermediate/
│   │   └── marts/
│   ├── tests/
│   ├── macros/
│   └── dbt_project.yml
│
├── databricks/
│   ├── data_ingestion/
│   ├── data_cleaning/
│   ├── transformations/
│   └── analysis/
│
├── python/
│   ├── data_quality/
│   ├── eda/
│   └── statistical_analysis/
│
├── sql/
│   ├── staging/
│   ├── transformations/
│   └── analytics/
│
├── powerbi/
│   ├── supply_chain_dashboard.pbix
│   └── screenshots/
│
├── presentation/
│   └── supply_chain_analytics.pptx
│
└── documentation/
    ├── architecture.png
    ├── er_diagram.png
    └── data_dictionary.xlsx
```

---

# 🔗 End-to-End Workflow

```text
                    RAW DATA
                       │
                       ▼
                 DATABRICKS
                       │
              Data Cleaning
              Data Profiling
              Transformation
                       │
                       ▼
                     dbt
                       │
          ┌────────────┼────────────┐
          │            │            │
       Staging    Intermediate     Marts
          │            │            │
          └────────────┼────────────┘
                       ▼
                ANALYTICAL DATA
                       │
                       ▼
                  POWER BI
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
      Executive     Supplier     Inventory
      Dashboard    Analytics     Analytics
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
      Logistics    Production    Business
      Analytics     Analytics     Insights
                       │
                       ▼
                PPT PRESENTATION
```

---

# 🎯 Project Outcomes

This project demonstrates an end-to-end **Supply Chain Analytics and Business Intelligence workflow**:

* ✅ Data ingestion using Databricks
* ✅ Data cleaning and transformation
* ✅ dbt data modelling
* ✅ SQL-based analytics
* ✅ Python-based exploratory analysis
* ✅ Data quality validation
* ✅ Star schema development
* ✅ Supply chain KPI development
* ✅ Advanced SQL analysis
* ✅ DAX calculations
* ✅ Interactive Power BI dashboards
* ✅ Drill-through analysis
* ✅ Executive reporting
* ✅ Business recommendations

---

# 🧰 Skills Demonstrated

```text
Databricks
dbt
SQL
Python
PySpark
Power BI
DAX
Data Modelling
ETL / ELT
Data Cleaning
Data Quality
Exploratory Data Analysis
Statistical Analysis
Business Intelligence
Supply Chain Analytics
Dashboard Development
Executive Reporting
```

---

# 📌 Project Summary

| Category                    | Details                       |
| --------------------------- | ----------------------------- |
| **Domain**                  | Supply Chain & Manufacturing  |
| **Data Period**             | 2019–2024                     |
| **Data Sources**            | CSV                           |
| **Data Processing**         | Databricks                    |
| **Transformation**          | dbt + SQL                     |
| **Analysis**                | SQL + Python                  |
| **BI Tool**                 | Power BI                      |
| **Development Environment** | VS Code                       |
| **Presentation**            | PowerPoint                    |
| **Architecture**            | End-to-End Analytics Platform |

---

## ⭐ Key Takeaway

The project demonstrates how raw supply chain data can be transformed into a structured analytics platform using **Databricks and dbt**, analyzed using **SQL and Python**, and delivered to business stakeholders through **Power BI dashboards and executive reporting**.

**Raw Data → Databricks → dbt → SQL/Python Analytics → Power BI → Business Insights**
