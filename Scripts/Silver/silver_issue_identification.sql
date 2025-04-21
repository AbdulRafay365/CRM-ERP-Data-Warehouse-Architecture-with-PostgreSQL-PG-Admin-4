-- ==========================
-- Table 1: crm_cust_info
-- ==========================

-- Identifying NULLs and Duplicates

SELECT cst_id, COUNT(*) AS Total_Values
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Identifying unwanted spaces

SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE
	cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE
	cst_lastname != TRIM(cst_lastname); -- Issues identified in firstname and last name

-- Checking consistency of values in low cardinality columns

SELECT DISTINCT(cst_marital_status) FROM bronze.crm_cust_info -- Objective is to change M, F to Male/Female/na in gender and Single/Married/na in Marital Status

-- ==========================
-- Table 2: crm_prd_info
-- ==========================

-- Null Checker
SELECT 
	SUM(CASE WHEN prd_id IS NULL THEN 1 ELSE 0 END) AS prd_id_nulls,
	SUM(CASE WHEN prd_key IS NULL THEN 1 ELSE 0 END) AS prd_key_nulls,
	SUM(CASE WHEN prd_nm IS NULL THEN 1 ELSE 0 END) AS prd_nm_nulls,
	SUM(CASE WHEN prd_cost IS NULL THEN 1 ELSE 0 END) AS prd_cost_nulls,
	SUM(CASE WHEN prd_line IS NULL THEN 1 ELSE 0 END) AS prd_line_nulls,
	SUM(CASE WHEN prd_start_dt IS NULL THEN 1 ELSE 0 END) AS prd_start_dt_nulls,
	SUM(CASE WHEN prd_end_dt IS NULL THEN 1 ELSE 0 END) AS prd_end_dt_nulls
FROM bronze.crm_prd_info;

SELECT	
	prd_nm, 
	COUNT(*)
FROM 
bronze.crm_prd_info
GROUP BY prd_nm
HAVING 
COUNT(*) > 1 OR prd_nm IS NULL;




