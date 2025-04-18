-- =====================================
-- CRM Customer Information Table
-- =====================================
DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
	cst_id INT,                                 -- Unique customer ID
	cst_key VARCHAR(50),                        -- Customer key (business key)
	cst_firstname VARCHAR(50),                  -- First name of customer
	cst_lastname VARCHAR(50),                   -- Last name of customer
	cst_marital_status CHAR(1),                 -- Marital status (e.g., M, S, D)
	cst_gndr CHAR(1),                           -- Gender (e.g., M/F)
	cst_create_date DATE                        -- Date customer was created
);

-- =====================================
-- CRM Product Information Table
-- =====================================
DROP TABLE IF EXISTS bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
	prd_id INT,                                 -- Unique product ID
	prd_key VARCHAR(50),                        -- Product business key
	prd_nm VARCHAR(50),                         -- Product name
	prd_cost FLOAT,                             -- Product cost
	prd_line VARCHAR(50),                       -- Product line/category
	prd_start_dt TIMESTAMP,                     -- Product availability start date
	prd_end_dt TIMESTAMP                        -- Product availability end date
);

-- =====================================
-- CRM Sales Details Table
-- =====================================
DROP TABLE IF EXISTS bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
	sls_ord_num VARCHAR(50),                    -- Sales order number
	sls_prd_key VARCHAR(50),                    -- Product key associated with the sale
	sls_cust_id INT,                            -- Customer ID who made the purchase
	sls_order_dt INT,                           -- Order date (e.g., YYYYMMDD or epoch)
	sls_ship_dt INT,                            -- Shipping date
	sls_due_dt INT,                             -- Due date for the order
	sls_sales INT,                              -- Total sales amount
	sls_quantity INT,                           -- Quantity of items sold
	sls_price INT                               -- Price per item
);

-- =====================================
-- ERP Customer Demographic Table (AZ12)
-- =====================================
DROP TABLE IF EXISTS bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
	CID VARCHAR(50),                            -- Customer ID
	BDATE DATE,                                 -- Birthdate
	GEN VARCHAR(50)                             -- Gender
);

-- =====================================
-- ERP Customer Location Table (A101)
-- =====================================
DROP TABLE IF EXISTS bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
	CID VARCHAR(50),                            -- Customer ID
	CNTRY VARCHAR(50)                           -- Country
);

-- =====================================
-- ERP Product Category Table (G1V2)
-- =====================================
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
	ID VARCHAR(50),                             -- Product or category ID
	CAT VARCHAR(50),                            -- Product category
	SUBCAT VARCHAR(50),                         -- Product sub-category
	MAINTENANCE VARCHAR(50)                     -- Maintenance notes or flag
);


-- =====================================
-- BULK LOAD
-- =====================================


-- =====================================
-- CRM Customer Information Table
-- =====================================
-- 1. Truncate and load data into the crm_cust_info table

-- Truncate the table to clear any existing data
TRUNCATE TABLE bronze.crm_cust_info;

-- Load data from CSV into crm_cust_info table
COPY bronze.crm_cust_info
FROM '/Library/PostgreSQL/17/Datasets/source_crm/cust_info.csv'
DELIMITER ',' 
CSV HEADER;

-- Verify the data loaded into crm_cust_info table
SELECT * FROM bronze.crm_cust_info;


-- =====================================
-- CRM Product Information Table
-- =====================================
-- 2. Truncate and load data into the crm_prd_info table

-- Truncate the table to clear any existing data
TRUNCATE TABLE bronze.crm_prd_info;

-- Load data from CSV into crm_prd_info table
COPY bronze.crm_prd_info 
FROM '/Library/PostgreSQL/17/Datasets/source_crm/prd_info.csv' 
DELIMITER ',' 
CSV HEADER;

-- Verify the data loaded into crm_prd_info table
SELECT * FROM bronze.crm_prd_info;


-- =====================================
-- CRM Sales Details Table
-- =====================================
-- 3. Truncate and load data into the crm_sales_details table

-- Truncate the table to clear any existing data
TRUNCATE TABLE bronze.crm_sales_details;

-- Load data from CSV into crm_sales_details table
COPY bronze.crm_sales_details 
FROM '/Library/PostgreSQL/17/Datasets/source_crm/sales_details.csv'
DELIMITER ',' 
CSV HEADER;

-- Verify the data loaded into crm_sales_details table
SELECT * FROM bronze.crm_sales_details;


-- =====================================
-- ERP Customer AZ12 Table
-- =====================================
-- 4. Truncate and load data into the erp_cust_AZ12 table

-- Truncate the table to clear any existing data
TRUNCATE TABLE bronze.erp_cust_AZ12;

-- Load data from CSV into erp_cust_AZ12 table
COPY bronze.erp_cust_AZ12
FROM '/Library/PostgreSQL/17/Datasets/source_erp/CUST_AZ12.csv'
DELIMITER ','
CSV HEADER;

-- Verify the data loaded into erp_cust_AZ12 table
SELECT * FROM bronze.erp_cust_AZ12;


-- =====================================
-- ERP Location A101 Table
-- =====================================
-- 5. Truncate and load data into the erp_LOC_A101 table

-- Truncate the table to clear any existing data
TRUNCATE TABLE bronze.erp_LOC_A101;

-- Load data from CSV into erp_LOC_A101 table
COPY bronze.erp_LOC_A101
FROM '/Library/PostgreSQL/17/Datasets/source_erp/LOC_A101.csv'
DELIMITER ','
CSV HEADER;

-- Verify the data loaded into erp_LOC_A101 table
SELECT * FROM bronze.erp_LOC_A101;


-- =====================================
-- ERP PX Category G1V2 Table
-- =====================================
-- 6. Truncate and load data into the erp_px_cat_g1v2 table

-- Truncate the table to clear any existing data
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

-- Load data from CSV into erp_px_cat_g1v2 table
COPY bronze.erp_px_cat_g1v2
FROM '/Library/PostgreSQL/17/Datasets/source_erp/PX_CAT_G1V2.csv'
DELIMITER ','
CSV HEADER;

-- Verify the data loaded into erp_px_cat_g1v2 table
SELECT * FROM bronze.erp_px_cat_g1v2;