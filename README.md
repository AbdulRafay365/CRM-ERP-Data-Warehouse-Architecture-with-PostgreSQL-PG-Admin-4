# CRM & ERP Data Warehouse Architecture with PostgreSQL & PG Admin 4 (WORK IN PROGRESS)

This repository highlights a complete end-to-end implementation of a modern analytics solution using PostgreSQL — from raw data ingestion to refined insights in Tableau, all built through a structured, layered Medallion-Style architecture.

Final Dashboard (⚠️ UNDER DEVELOPMENT):
<div align="center">
  <img width="1203" alt="<img width="1301" alt="Screenshot 2025-06-11 at 3 01 30 PM" src="https://github.com/user-attachments/assets/70467859-c76e-4f82-a975-5c309b34bdb1" />
</div>

---

## Modern Data Stack Architecture

The project is designed using the **Medallion Architecture** model, featuring three distinct layers for scalable data transformation:

![High Level Architecture](https://github.com/user-attachments/assets/01b1ab91-9a21-477e-87d6-56b7408ba593)

### 🥉 Bronze Layer  
Stores raw, unprocessed data directly from CSV files. Data is loaded as-is into PostgreSQL for traceability.

### 🥈 Silver Layer  
In this layer, data undergoes essential transformations: cleaning, validation, and standardization to prep for analysis.

### 🥇 Gold Layer  
This layer contains business-ready, analysis-optimized data. Data is modeled using a **Star Schema** to support robust analytics and reporting.

![Gold ERD](https://github.com/AbdulRafay365/CRM-ERP-Data-Warehouse-Architecture-with-PostgreSQL-PG-Admin-4/blob/main/Documents/Gold%20Layer%20ERD.png)

##### [Final Gold Views](https://drive.google.com/drive/folders/1GZL7wKnuCOsxT3CmLQTtaIogmdH99bxu?usp=drive_link)
---

## Project Highlights

This project demonstrates practical skills in:

- **PostgreSQL-based Data Engineering**
- **ETL Pipelines** (Extraction, Transformation, Load)
- **Dimensional Modeling** (Star Schema)
- **SQL Reporting** and dashboard support
- Data Visualization

Key workflows include:

- Designing scalable data pipelines
- Building analytical data models
- Creating SQL reports for business insights
- Delivering insights through Tableau (**In Progress**)

---

## Tech Stack & Tools

All resources and tools used are open and accessible:

- **PostgreSQL** – Open-source database platform for storage & transformations
- **PGAdmin** - Interface to work with Postgre Databases
- **CSV Datasets** – ERP & CRM data used as source systems  
- **pgAdmin / Terminal** – GUI clients for PostgreSQL  
- **Draw.io** – Data architecture and modeling diagrams  
- **GitHub** – Version control and collaboration  
- **Notion** – Project task management and documentation | [SQL Data Warehouse Project](https://www.notion.so/SQL-Data-Warehouse-Project-1d964c033bf780ac9161f1ddc0cdf2f0)
- **Tableau** - Data visualization to derive insights

---

## Project Workflow & Goals

### Build the Data Warehouse  
**Goal**: Create a PostgreSQL data warehouse for consolidated sales analytics

- Import ERP & CRM data from CSV files
- Clean, normalize, and unify data into one cohesive model
- Focus on current data only (no historical tracking required)
- Model data using dimensions and facts for efficient querying

### Perform Data Analysis  
**Goal**: Deliver meaningful insights using SQL-based queries

Analyze business-critical metrics like:

- Customer behavior trends  
- Product-level performance  
- Sales growth and regional analysis  

### Build a Tableau Dashboard Using Gold Views
**Goal**: Summarize insights using KPIs and Graphs in an Interactive Dashboard using Tableau

Visualize Metrics liks:

- Total Sales
- Top Products
- Top Customers
- Top Regions
  
---

## Repository Structure
```
data-warehouse-project/
│
├── Datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── Documents/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── Scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── Tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
```

---

## About Me
<p align="center">
  <img src="https://github.com/user-attachments/assets/2dc8ff3d-c4cb-43d4-9042-f49df7c2698a" alt="image" />
</p>
I am a data enthusiast with a strong interest in business intelligence, data analytics, and visualization. I enjoy transforming raw data into actionable insights using tools like SQL, Tableau, and Python. With hands-on experience in building data pipelines and dashboards, I aim to bridge the gap between data and decision-making.

---

## Links and Contact

- 📧 [Email](mailto:abdulrafaymohammed365@gmail.com)  
- 📞 Phone: +1 (437) 661-3674  
- 💼 [LinkedIn](https://www.linkedin.com/in/abdulrafaymohammed365)  
- 💻 [GitHub](https://github.com/AbdulRafay365)  
- 📊 [Tableau Public](https://public.tableau.com/app/profile/abdul.rafay.mohammed2129/vizzes)
  
A special thanks to [@DataWithBaraa](https://github.com/DataWithBaraa) for inspiring me to work on this project :)

