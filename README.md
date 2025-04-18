# Data Warehouse & Analytics with PostgreSQL

Welcome to my Data Warehouse and Analytics portfolio project! 
This repository showcases an end-to-end implementation of a modern analytics solution using PostgreSQL. It covers everything from raw data ingestion to polished insights through a layered architecture approach.

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

