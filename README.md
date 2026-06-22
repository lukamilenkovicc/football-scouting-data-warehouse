# Football Scouting Analytics System (ETL & Data Warehouse)

This repository contains the project for the **ETL and Data Warehouses** course, titled **"Analytical System for Football Scouting Support"**. 

The main objective of this project is to build an end-to-end data warehousing solution that processes football player statistics and metrics to support data-driven scouting decisions, market value estimations, and performance analysis.

## Project Overview
Modern football clubs require advanced analytical tools to discover talent and optimize transfer budgets. This system integrates raw football data from Kaggle, transforms it through an ETL pipeline implemented via Microsoft SSIS, and loads it into a dimensional model (Data Warehouse) designed for fast and intuitive reporting.

### 🔍 Core Analytical Questions Addressed
The system is built to provide data-driven insights into football scouting by addressing the exact research questions defined in the project blueprint:

* **Process 1: Underpriced Talents **
  *Research Question:* Which players under the age of 23 have a higher average team performance rate (Goals + Assists per 90 minutes) than their league's average, while their current market value is stagnating/decreasing compared to the previous change, or is below the average value for that specific position? 
  *Objective:* Discover hidden, high-performing young talents before they are widely noticed in the transfer market.

* **Process 2: League Development Analysis (Analiza liga po razvoju igrača)**
  *Research Question:* In which football leagues do players experience the highest surge/growth between their initial market value and their career-peak market value? 
  *Objective:* Identify the best developmental leagues where player valuations grow most significantly.

* **Process 3: Transfer Optimization (Optimizacija transfera)**
  *Research Question:* Which players have their contracts expiring within the next 18 months while simultaneously showing a stable increase in their market value? 
  *Objective:* Target cost-effective, low-risk transfer opportunities (potential free agents) who are currently in rising form.


### Key Features:
* **Business Intelligence Framework:** Aligned with scouting management processes and gap analysis.
* **Dimensional Modeling:** Designed using a Constellation schema in SQL Server optimized for analytical queries (Facts and Dimensions).
* **SSIS ETL Pipeline:** Robust Extraction, Transformation, and Loading (ETL) procedures utilizing SSIS packages to clean and structure transfer market and performance data.
* **Interactive Dashboards:** Visualizations and reports created in Power BI to assist scouts and club management in decision-making.

## Tech Stack & Architecture
* **Database / Data Warehouse:** Microsoft SQL Server
* **ETL Tools:** Microsoft SQL Server Integration Services (SSIS)
* **BI & Analytics:** Power BI
* **Dataset Source:** Kaggle Player Scores Dataset

## Repository Structure
```text
├── database/              # DDL scripts, schema definition, Constellation model (.sql)
├── ssis-etl/              # SSIS Project, Solution, and Control/Data Flow packages (.dtsx, .dtproj)
├── reports/               # Power BI dashboards (.pbix)
└── README.md              # Project overview
