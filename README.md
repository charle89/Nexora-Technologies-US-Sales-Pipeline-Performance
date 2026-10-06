Nexora Technologies — US Sales Pipeline & Performance Analysis

MySQL | SQL | Power BI | DAX | Data Cleaning | Data Modeling | Data Visualization

View Dashboard · View SQL Analysis · View Project Case Study

Portfolio Simulation: Nexora Technologies is a fictional B2B technology company created for this portfolio project. The dataset is synthetic and is used to demonstrate an end-to-end sales analytics workflow.

               Project Overview

Nexora Technologies needed a clearer view of its US sales pipeline to understand opportunity value, sales-stage progression, representative performance, product performance, lead sources, and geographic trends.

I built an end-to-end sales analytics solution using MySQL and Power BI, transforming raw sales opportunity data into an interactive executive dashboard.

The project analyzes 200 sales opportunities representing approximately $2.30M in pipeline value.

Business Questions

The analysis was designed to answer:

How large is the current sales pipeline?
How many sales opportunities are being managed?
What percentage of closed opportunities are won?
Which sales representatives manage the largest pipelines?
Which products generate the most opportunity value?
Which lead sources generate the strongest pipeline?
Where are opportunities concentrated within the sales funnel?
How does pipeline activity change over time?
Which US states generate the highest opportunity value?
🛠️ Tools & Technologies
Tool	Purpose
MySQL	Database creation, validation and SQL analysis
SQL	KPI calculations, aggregations and analytical views
Power BI	Interactive dashboard and reporting
DAX	Business measures and KPI calculations
Power Query	Data transformation and preparation
GitHub	Version control and project documentation

🔄 Analytical Workflow
Raw Sales Data
      ↓
MySQL Database
      ↓
Data Quality Validation
      ↓
SQL Analysis & Views
      ↓
Power BI Connection
      ↓
Data Modeling & DAX
      ↓
Interactive Dashboard
      ↓
Business Insights
🗄️ MySQL Analysis

The sales data was loaded into MySQL and validated before analysis.

Key SQL analysis included:

Overall Pipeline Performance
Total opportunities
Total pipeline value
Average deal value
Minimum deal value
Maximum deal value
Sales Representative Performance
Opportunity count by representative
Pipeline value by representative
Average deal value by representative
Product Performance
Opportunity volume by product
Pipeline value by product
Average deal value by product
Lead Source Analysis
Opportunity volume by lead source
Pipeline value by lead source
Average deal value by lead source
Sales Funnel Analysis

Opportunities were analyzed across:

New Lead → Contacted → Qualified → Proposal Sent → Negotiation → Closed Won / Closed Lost

A custom SQL CASE statement was used to maintain the correct business sequence.

Win Rate

Win rate was calculated using closed opportunities:

Win Rate =
Closed Won / (Closed Won + Closed Lost)

NULLIF() was used to prevent division-by-zero errors.

Monthly Analysis

Pipeline activity was aggregated by month using the opportunity close date to identify changes in sales activity over time.

Geographic Analysis

Opportunity count, pipeline value and average deal value were analyzed by US state.

📈 Power BI Dashboard

The SQL analysis was connected to Power BI to create an interactive executive sales dashboard.

<img width="1366" height="768" alt="Screenshot (269)" src="https://github.com/user-attachments/assets/9943a89c-45cb-424a-b17c-4d31dae18c7e" />



Dashboard Components

KPI Cards

Total Pipeline Value
Total Opportunities
Closed Won
Closed Lost
Win Rate

Visualizations

Monthly Pipeline Trend
Sales Funnel
Pipeline Value by Sales Representative
Product Performance
Geographic Performance

Interactive Filters

Product
Sales Representative

The dashboard allows users to move from high-level KPIs into specific areas of the sales pipeline.

     Data Quality & Validation

Before building the dashboard, I performed data-quality validation in MySQL.

The validation process included checking for potential duplicate opportunity records using key business fields such as:

Customer
State
Sales Representative
Product
Sales Stage
Deal Value
Lead Source
Close Date

This helped prevent duplicate records from distorting opportunity counts and pipeline calculations.

💡 Business Value

The dashboard provides sales management with a centralized view of pipeline performance.

The analysis can help identify:

High-value sales representatives
Products generating the greatest pipeline
Stronger lead sources
Funnel stages where opportunities accumulate
Changes in monthly pipeline activity
Geographic markets with higher opportunity value
Closed-won versus closed-lost performance

The project demonstrates how raw sales data can be transformed into a decision-support tool rather than simply producing static reports.

  Challenges & Solutions
Challenge 1 — Raw data lacked management-level KPIs

Solution:
Used SQL aggregation functions such as COUNT(), SUM(), AVG(), MIN() and MAX() to transform individual opportunity records into business metrics.

Challenge 2 — Potential duplicate records

Solution:
Created SQL validation logic to identify duplicate combinations across important business fields.

Challenge 3 — Correct sales funnel ordering

Solution:
Used a SQL CASE statement to establish the correct sales-stage sequence.

Challenge 4 — Win-rate calculation

Solution:
Calculated win rate using only closed opportunities rather than all opportunities.

Challenge 5 — Turning SQL analysis into an executive reporting tool

Solution:
Connected MySQL to Power BI and transformed the analytical results into KPI cards, charts, funnel analysis and interactive filters.

  Repository Structure
nexora-us-sales-pipeline-analysis/
│
├── sql/
│   └── nexora_sales_analysis.sql
│
├── powerbi/
│   └── Nexora_US_Sales_Dashboard.pbix
│
├── screenshots/
│   └── dashboard.png
│
├── documentation/
│   └── project-case-study.md
│
├── data/
│   └── README.md
│
└── README.md
🎯 Key Skills Demonstrated
SQL querying
MySQL database management
Data quality validation
Data aggregation
Analytical view creation
KPI development
DAX
Power BI dashboard development
Data modeling
Business intelligence
Sales pipeline analysis
Data storytelling
Business problem solving
👤 About Me

Ajayi Babatunde Charles
Data Analyst | Virtual Assistant

I use SQL, Power BI, Excel and Python to transform business data into reliable reporting, actionable insights and decision-support tools.

LinkedIn · Portfolio
