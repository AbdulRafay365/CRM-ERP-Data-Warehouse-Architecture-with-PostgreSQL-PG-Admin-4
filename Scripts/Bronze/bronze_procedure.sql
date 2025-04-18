-- ============================================================================
-- Stored Procedure: Load Bronze Layer (Source -> Bronze)
-- ============================================================================
-- Script Purpose:
--     Loads CSV data into tables in the 'bronze' schema.
--     Prints status messages and load durations for transparency.
--
-- Usage:
--     CALL bronze.load_bronze();
-- ============================================================================

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP := now();
    batch_end_time TIMESTAMP;
BEGIN
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    -- CRM Tables
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    -- crm_cust_info
    start_time := now();
    RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;

    RAISE NOTICE '>> Loading Data Into: bronze.crm_cust_info';
    COPY bronze.crm_cust_info
    FROM '/Library/PostgreSQL/17/Datasets/source_crm/cust_info.csv'
    DELIMITER ',' CSV HEADER;
    end_time := now();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(SECOND FROM end_time - start_time);

    -- crm_prd_info
    start_time := now();
    RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;

    RAISE NOTICE '>> Loading Data Into: bronze.crm_prd_info';
    COPY bronze.crm_prd_info
    FROM '/Library/PostgreSQL/17/Datasets/source_crm/prd_info.csv'
    DELIMITER ',' CSV HEADER;
    end_time := now();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(SECOND FROM end_time - start_time);

    -- crm_sales_details
    start_time := now();
    RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;

    RAISE NOTICE '>> Loading Data Into: bronze.crm_sales_details';
    COPY bronze.crm_sales_details
    FROM '/Library/PostgreSQL/17/Datasets/source_crm/sales_details.csv'
    DELIMITER ',' CSV HEADER;
    end_time := now();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(SECOND FROM end_time - start_time);

    -- ERP Tables
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';

    -- erp_loc_a101
    start_time := now();
    RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;

    RAISE NOTICE '>> Loading Data Into: bronze.erp_loc_a101';
    COPY bronze.erp_loc_a101
    FROM '/Library/PostgreSQL/17/Datasets/source_erp/loc_a101.csv'
    DELIMITER ',' CSV HEADER;
    end_time := now();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(SECOND FROM end_time - start_time);

    -- erp_cust_az12
    start_time := now();
    RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12;

    RAISE NOTICE '>> Loading Data Into: bronze.erp_cust_az12';
    COPY bronze.erp_cust_az12
    FROM '/Library/PostgreSQL/17/Datasets/source_erp/cust_az12.csv'
    DELIMITER ',' CSV HEADER;
    end_time := now();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(SECOND FROM end_time - start_time);

    -- erp_px_cat_g1v2
    start_time := now();
    RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    RAISE NOTICE '>> Loading Data Into: bronze.erp_px_cat_g1v2';
    COPY bronze.erp_px_cat_g1v2
    FROM '/Library/PostgreSQL/17/Datasets/source_erp/px_cat_g1v2.csv'
    DELIMITER ',' CSV HEADER;
    end_time := now();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(SECOND FROM end_time - start_time);

    -- Final
    batch_end_time := now();
    RAISE NOTICE '==========================================';
    RAISE NOTICE 'Loading Bronze Layer is Completed';
    RAISE NOTICE '   - Total Load Duration: % seconds', EXTRACT(SECOND FROM batch_end_time - batch_start_time);
    RAISE NOTICE '==========================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '==========================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE '==========================================';
END;
$$;

CALL bronze.load_bronze()
