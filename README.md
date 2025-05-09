# CRM & ERP Data Warehouse Architecture with PostgreSQL & PG Admin 4

This repository highlights a complete end-to-end implementation of a modern analytics solution using PostgreSQL — from raw data ingestion to refined insights, all built through a structured, layered architecture.

A special thanks to [@DataWithBaraa](https://github.com/DataWithBaraa) for the invaluable guidance and step-by-step direction throughout this project.

---

## Modern Data Stack Architecture

The project is designed using the **Medallion Architecture** model, featuring three distinct layers for scalable data transformation:

![image](https://github.com/user-attachments/assets/d25f6e62-10d0-416a-9252-e6c048d046d6)

### 🥉 Bronze Layer  
Stores raw, unprocessed data directly from CSV files. Data is loaded as-is into PostgreSQL for traceability.

### 🥈 Silver Layer  
In this layer, data undergoes essential transformations: cleaning, validation, and standardization to prep for analysis.

### 🥇 Gold Layer  
This layer contains business-ready, analysis-optimized data. Data is modeled using a **Star Schema** to support robust analytics and reporting.
[Final Gold Views](https://drive.google.com/drive/folders/1GZL7wKnuCOsxT3CmLQTtaIogmdH99bxu?usp=drive_link)
---

## Project Highlights

This project demonstrates practical skills in:

- **PostgreSQL-based Data Engineering**
- **ETL Pipelines** (Extraction, Transformation, Load)
- **Dimensional Modeling** (Star Schema)
- **SQL Reporting** and dashboard support

Key workflows include:

- Designing scalable data pipelines
- Building analytical data models
- Creating SQL reports for business insights

---

## Tech Stack & Tools

All resources and tools used are open and accessible:

- **PostgreSQL** – Open-source database platform for storage & transformations  
- **CSV Datasets** – ERP & CRM data used as source systems  
- **pgAdmin / Terminal** – GUI clients for PostgreSQL  
- **Draw.io** – Data architecture and modeling diagrams  
- **GitHub** – Version control and collaboration  
- **Notion** – Project task management and documentation | [SQL Data Warehouse Project](https://www.notion.so/SQL-Data-Warehouse-Project-1d964c033bf780ac9161f1ddc0cdf2f0)

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

---

## Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```

---

## About Me

---

## License

---

## Socials

