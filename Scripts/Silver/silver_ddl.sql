-- =====================================
-- CRM Customer Information Table
-- =====================================
DROP TABLE IF EXISTS silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info (
			cst_id INT,                                 -- Unique customer ID
			cst_key VARCHAR(50),                        -- Customer key (business key)
			cst_firstname VARCHAR(50),                  -- First name of customer
			cst_lastname VARCHAR(50),                   -- Last name of customer
			cst_marital_status VARCHAR(50),                 -- Marital status (e.g., M, S, D)
			cst_gndr VARCHAR(50),                           -- Gender (e.g., M/F)
			cst_create_date DATE,                        -- Date customer was created
			dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date and time of record create
);

-- =====================================
-- CRM Product Information Table
-- =====================================
DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
			prd_id INT,                                 -- Unique product ID
			cat_id VARCHAR(50),							 -- NEW connects to cat_id in another table
			prd_key VARCHAR(50),					     -- NEW connects to prd_key in another table
			prd_nm VARCHAR(50),                         -- Product name
			prd_cost FLOAT,                             -- Product cost
			prd_line VARCHAR(50),                       -- Product line/category
			prd_start_dt DATE,                          -- Product availability start date (CHANGED TYPE)
			prd_end_dt DATE,                            -- Product availability end date (CHANGED TYPE)
			dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date and time of record create
);

-- =====================================
-- CRM Sales Details Table
-- =====================================
DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
			sls_ord_num VARCHAR(50),                    -- Sales order number
			sls_prd_key VARCHAR(50),                    -- Product key associated with the sale
			sls_cust_id INT,                            -- Customer ID who made the purchase
			sls_order_dt DATE,                           -- Order date (e.g., YYYYMMDD or epoch)
			sls_ship_dt DATE,                            -- Shipping date
			sls_due_dt DATE,                             -- Due date for the order
			sls_sales INT,                              -- Total sales amount
			sls_quantity INT,                           -- Quantity of items sold
			sls_price INT,                               -- Price per item
			dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date and time of record create
);

-- =====================================
-- ERP Customer Demographic Table (AZ12)
-- =====================================
DROP TABLE IF EXISTS silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12 (
	CID VARCHAR(50),                            -- Customer ID
	BDATE DATE,                                 -- Birthdate
	GEN VARCHAR(50),                             -- Gender
	dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date and time of record create
);

-- =====================================
-- ERP Customer Location Table (A101)
-- =====================================
DROP TABLE IF EXISTS silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101 (
	CID VARCHAR(50),                            -- Customer ID
	CNTRY VARCHAR(50),                           -- Country
	dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date and time of record create
);

-- =====================================
-- ERP Product Category Table (G1V2)
-- =====================================
DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2 (
	ID VARCHAR(50),                             -- Product or category ID
	CAT VARCHAR(50),                            -- Product category
	SUBCAT VARCHAR(50),                         -- Product sub-category
	MAINTENANCE VARCHAR(50),                     -- Maintenance notes or flag
	dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date and time of record create
);

-- Schema Tests
SELECT * FROM bronze.crm_sales_details; 
SELECT * FROM silver.crm_sales_details;
-- Schema tests for bronze and silver Successful :)

