/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

-- ==============================================================================
-- Procedure: load_silver
-- Description: Loads cleansed and transformed data from bronze to silver schema
-- ==============================================================================

CREATE OR REPLACE PROCEDURE silver.load_silver()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP := clock_timestamp();
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
BEGIN
    RAISE NOTICE 'Starting load_silver at %', start_time;

    -- Lock all silver tables before truncation and insertion
    LOCK TABLE 
        silver.crm_cust_info,
        silver.crm_prd_info,
        silver.crm_sales_details,
        silver.erp_cust_az12,
        silver.erp_loc_a101,
        silver.erp_px_cat_g1v2 IN ACCESS EXCLUSIVE MODE;

    --------------------------------------------------------------------------
    -- CRM Customer Info
    --------------------------------------------------------------------------
    batch_start_time := clock_timestamp();

    TRUNCATE silver.crm_cust_info;

    INSERT INTO silver.crm_cust_info (
        cst_id,
        cst_key,
        cst_firstname,
        cst_lastname,
        cst_marital_status,
        cst_gndr,
        cst_create_date
    )
    SELECT 
        cst_id,
        cst_key,
        TRIM(cst_firstname),
        TRIM(cst_lastname),
        CASE 
            WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
            WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
            WHEN cst_marital_status = 'D' THEN 'Divorced'
            ELSE 'n/a'
        END,
        CASE 
            WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
            WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
            ELSE 'n/a'
        END,
        cst_create_date
    FROM (
        SELECT *, ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
        FROM bronze.crm_cust_info
        WHERE cst_id IS NOT NULL
    ) t
    WHERE flag_last = 1;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'crm_cust_info loaded in % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);


    --------------------------------------------------------------------------
    -- CRM Product Info
    --------------------------------------------------------------------------
    batch_start_time := clock_timestamp();

    TRUNCATE silver.crm_prd_info;

    INSERT INTO silver.crm_prd_info (
        prd_id,
        cat_id,
        prd_key,
        prd_nm,
        prd_cost,
        prd_line,
        prd_start_dt,
        prd_end_dt
    )
    SELECT 
        prd_id,
        CAST(REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS VARCHAR(50)),
        CAST(SUBSTRING(prd_key, 7) AS VARCHAR(50)),
        prd_nm,
        CASE 
            WHEN prd_cost IS NULL OR prd_cost < 0 THEN 0
            ELSE prd_cost
        END,
        CASE UPPER(TRIM(prd_line))
            WHEN 'M' THEN 'Mountain'
            WHEN 'R' THEN 'Road'
            WHEN 'S' THEN 'Other Sales'
            WHEN 'T' THEN 'Touring'
            ELSE prd_line
        END,
        CAST(prd_start_dt AS DATE),
        CASE 
            WHEN prd_end_dt IS NULL OR prd_end_dt < prd_start_dt THEN NULL
            ELSE prd_end_dt
        END
    FROM bronze.crm_prd_info;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'crm_prd_info loaded in % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);


    --------------------------------------------------------------------------
    -- CRM Sales Details
    --------------------------------------------------------------------------
    batch_start_time := clock_timestamp();

    TRUNCATE silver.crm_sales_details;

    INSERT INTO silver.crm_sales_details (
        sls_ord_num,
        sls_prd_key,
        sls_cust_id,
        sls_order_dt,
        sls_ship_dt,
        sls_due_dt,
        sls_sales,
        sls_quantity,
        sls_price
    )
    SELECT 
        sls_ord_num,
        sls_prd_key,
        sls_cust_id,
        CASE 
            WHEN sls_order_dt = 0 OR LENGTH(sls_order_dt::TEXT) != 8 THEN NULL
            ELSE TO_DATE(sls_order_dt::TEXT, 'YYYYMMDD')
        END,
        CASE 
            WHEN sls_ship_dt = 0 OR LENGTH(sls_ship_dt::TEXT) != 8 THEN NULL
            ELSE TO_DATE(sls_ship_dt::TEXT, 'YYYYMMDD')
        END,
        CASE 
            WHEN sls_due_dt = 0 OR LENGTH(sls_due_dt::TEXT) != 8 THEN NULL
            ELSE TO_DATE(sls_due_dt::TEXT, 'YYYYMMDD')
        END,
        CASE 
            WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != sls_quantity * ABS(sls_price)
                THEN sls_quantity * ABS(sls_price)
            ELSE sls_sales
        END,
        sls_quantity,
        CASE 
            WHEN sls_price IS NULL OR sls_price <= 0 
                THEN sls_sales / NULLIF(sls_quantity, 0)
            ELSE sls_price
        END
    FROM bronze.crm_sales_details;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'crm_sales_details loaded in % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);


    --------------------------------------------------------------------------
    -- ERP Customer az12
    --------------------------------------------------------------------------
    batch_start_time := clock_timestamp();

    TRUNCATE silver.erp_cust_az12;

    INSERT INTO silver.erp_cust_az12 (
        cid,
        bdate,
        gen
    )
    SELECT
        CASE
            WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid FROM 4)
            ELSE cid
        END,
        CASE
            WHEN bdate > CURRENT_DATE THEN NULL
            ELSE bdate
        END,
        CASE
            WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
            WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
            ELSE 'n/a'
        END
    FROM bronze.erp_cust_az12;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'erp_cust_az12 loaded in % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);


    --------------------------------------------------------------------------
    -- ERP Location a101
    --------------------------------------------------------------------------
    batch_start_time := clock_timestamp();

    TRUNCATE silver.erp_loc_a101;

    INSERT INTO silver.erp_loc_a101 (
        cid,
        cntry
    )
    SELECT
        REPLACE(cid, '-', ''),
        CASE
            WHEN TRIM(cntry) = 'DE' THEN 'Germany'
            WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
            WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
            ELSE TRIM(cntry)
        END
    FROM bronze.erp_loc_a101;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'erp_loc_a101 loaded in % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);


    --------------------------------------------------------------------------
    -- ERP Product Category g1v2
    --------------------------------------------------------------------------
    batch_start_time := clock_timestamp();

    TRUNCATE silver.erp_px_cat_g1v2;

    INSERT INTO silver.erp_px_cat_g1v2 (
        id,
        cat,
        subcat,
        maintenance
    )
    SELECT
        id,
        cat,
        subcat,
        maintenance
    FROM bronze.erp_px_cat_g1v2;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'erp_px_cat_g1v2 loaded in % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);


    --------------------------------------------------------------------------
    -- End
    --------------------------------------------------------------------------
    end_time := clock_timestamp();
    RAISE NOTICE 'Completed load_silver at %, total duration: % seconds', end_time, EXTRACT(SECOND FROM end_time - start_time);

END;
$$;

CALL silver.load_silver();
