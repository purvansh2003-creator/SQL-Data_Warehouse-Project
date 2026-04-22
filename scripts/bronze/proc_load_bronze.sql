/*
=================================================================================================================
Stored Procedure : Load Bronze Layer (Source -> Bronze)
=================================================================================================================
Script Purpose : This script creates a stored procedure 'bronze.load_bronze' which Full load (Truncate & Insert) the tables in 
                 Bronze layer . It also tells the estimated time to Load Table individually as well as Time taken to load 
                 all tables .
                 It Performs Following actions :
                 - Truncates the broze table before loading data
                 - Uses the 'BULK INSERT' command to load data from csv files to bronze tables
Parameters : 
              None . This Stored Procedure does not accept any parameters or return any values.

Usage Exampe : Exec bronze.load_bronze;
==================================================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME , @end_time DATETIME ,@bronze_start_time DATETIME,@bronze_end_time DATETIME ;

	BEGIN TRY
	SET @bronze_start_time = GETDATE();
	PRINT '======================================================================='
	PRINT 'LOADING BRONZE LAYER'
	PRINT '======================================================================='

	PRINT '-----------------------------------------------------------------------'
	PRINT 'LOADING CRM FOLDER TABLES'
	PRINT '-----------------------------------------------------------------------'
    /* ---------------------crm_cust_info-----------------------------------*/
	SET @start_time = GETDATE();
	PRINT '>> TRUNCATING TABLE : bronze.crm_cust_info'
	TRUNCATE TABLE bronze.crm_cust_info;
	PRINT '>> INSERTING DATA INTO : bronze.crm_cust_info'
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\purva\Desktop\PURVANSH\SQL_DATAWAREHOUSE_PROJECT\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
	SET @end_time = GETDATE();
	PRINT ' TIME TAKEN TO LOAD : ' + CAST(DATEDIFF(MILLISECOND,@start_time,@end_time) AS NVARCHAR) + ' MILLISECONDS';
	PRINT '---------------------------------------------------------'
	/* ---------------------crm_prd_info----------------------------------- */
	SET @start_time = GETDATE();
	PRINT '>> TRUNCATING TABLE : bronze.crm_prd_info'
	TRUNCATE TABLE bronze.crm_prd_info;
	PRINT '>> INSERTING DATA INTO : bronze.crm_prd_info'
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\purva\Desktop\PURVANSH\SQL_DATAWAREHOUSE_PROJECT\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
	SET @end_time = GETDATE();
	PRINT ' TIME TAKEN TO LOAD : ' + CAST(DATEDIFF(MILLISECOND,@start_time,@end_time) AS NVARCHAR) + ' MILLISECONDS';
	PRINT '---------------------------------------------------------'
	/* ---------------------crm_sales_details-----------------------------------*/
	SET @start_time = GETDATE();
	PRINT '>> TRUNCATING TABLE : bronze.crm_sales_details'
	TRUNCATE TABLE bronze.crm_sales_details;
	PRINT '>> INSERTING DATA INTO : bronze.crm_sales_details'
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\purva\Desktop\PURVANSH\SQL_DATAWAREHOUSE_PROJECT\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
	SET @end_time = GETDATE();
	PRINT ' TIME TAKEN TO LOAD : ' + CAST(DATEDIFF(MILLISECOND,@start_time,@end_time) AS NVARCHAR) + ' MILLISECONDS';
	
	/* ----------------------------------------------------------------------------------------*/
	PRINT '---------------------------------------------------------'
	PRINT ' CRM FOLDER TABLES LOADING COMPLETE '
	PRINT '---------------------------------------------------------'

	PRINT '---------------------------------------------------------'
	PRINT ' NOW , LOADING ERP FOLDER TABLES '
	PRINT '---------------------------------------------------------'

	/* ---------------------erp_CUST_AZ12-----------------------------------*/
	SET @start_time = GETDATE();
	PRINT '>> TRUNCATING TABLE : bronze.erp_CUST_AZ12'
	TRUNCATE TABLE bronze.erp_CUST_AZ12;
	PRINT '>> INSERTING DATA INTO : bronze.erp_CUST_AZ12'
	BULK INSERT bronze.erp_CUST_AZ12
	FROM 'C:\Users\purva\Desktop\PURVANSH\SQL_DATAWAREHOUSE_PROJECT\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
	SET @end_time = GETDATE();
	PRINT ' TIME TAKEN TO LOAD : ' + CAST(DATEDIFF(MILLISECOND,@start_time,@end_time) AS NVARCHAR) + ' MILLISECONDS';
	PRINT '---------------------------------------------------------'
	/* ---------------------erp_LOC_A101-----------------------------------*/
	SET @start_time = GETDATE();
	PRINT '>> TRUNCATING TABLE : bronze.erp_LOC_A101'
	TRUNCATE TABLE bronze.erp_LOC_A101;
	PRINT '>> INSERTING DATA INTO : bronze.erp_LOC_A101'
	BULK INSERT bronze.erp_LOC_A101
	FROM 'C:\Users\purva\Desktop\PURVANSH\SQL_DATAWAREHOUSE_PROJECT\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
	SET @end_time = GETDATE();
	PRINT ' TIME TAKEN TO LOAD : ' + CAST(DATEDIFF(MILLISECOND,@start_time,@end_time) AS NVARCHAR) + ' MILLISECONDS';
	PRINT '---------------------------------------------------------'
	/* ---------------------erp_PX_CAT_G1V2-----------------------------------*/
	SET @start_time = GETDATE();
	PRINT '>> TRUNCATING TABLE : bronze.erp_PX_CAT_G1V2'
	TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
	PRINT '>> INSERTING DATA INTO : bronze.erp_PX_CAT_G1V2'
	BULK INSERT bronze.erp_PX_CAT_G1V2
	FROM 'C:\Users\purva\Desktop\PURVANSH\SQL_DATAWAREHOUSE_PROJECT\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
	SET @end_time = GETDATE();
	PRINT ' TIME TAKEN TO LOAD : ' + CAST(DATEDIFF(MILLISECOND,@start_time,@end_time) AS NVARCHAR) + ' MILLISECONDS';

	/* ----------------------------------------------------------------------------------------*/
	SET @bronze_end_time = GETDATE();
	PRINT '---------------------------------------------------------'
	PRINT ' ERP FOLDER TABLES LOADING COMPLETE '
	PRINT '---------------------------------------------------------'

	PRINT '========================================================='
	PRINT ' BRONZE LAYER LOADING COMPLETE '
	PRINT '========================================================='
	PRINT ' TIME TAKEN TO LOAD BRONZE LAYER : ' + CAST(DATEDIFF(MILLISECOND,@bronze_start_time,@bronze_end_time) AS NVARCHAR) + ' MILLISECONDS';
	END TRY
	BEGIN CATCH 
	PRINT '========================================================='
	PRINT 'ERROR OCCURED DURING LOADING'
	PRINT ' ERROR MESSAGE : ' + CAST(ERROR_MESSAGE() AS NVARCHAR) ;
	PRINT ' ERROR NUMBER : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT ' ERROR STATE : ' + CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '========================================================='
	END CATCH

END

