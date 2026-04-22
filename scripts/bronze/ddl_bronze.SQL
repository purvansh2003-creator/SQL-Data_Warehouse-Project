/* 
========================================================================================================================
DDL SCRIPT : Create Bronze Tables
========================================================================================================================

Script Purpose : 
        This script creates tables in the 'bronze' schema , dropping existing tables if they already exists
        
========================================================================================================================
*/

IF OBJECT_ID('bronze.crm_cust_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info
GO
Create Table bronze.crm_cust_info(
cst_id INT,
cst_key Nvarchar(50) ,
cst_firstname Nvarchar(50) ,
cst_lastname Nvarchar(50) ,
cst_marital_status Nvarchar(50) ,
cst_gndr Nvarchar(50),
cst_create_date Date
);

IF OBJECT_ID('bronze.crm_prd_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info
GO
Create Table bronze.crm_prd_info(
prd_id INT,
prd_key Nvarchar(50) ,
prd_nm Nvarchar(50) ,
prd_cost INT ,
prd_start_dt NVARCHAR (50),
prd_end_dt NVARCHAR (50)
);

IF OBJECT_ID('bronze.crm_sales_details' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details
GO
Create Table bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key Nvarchar(50) ,
sls_cust_id Nvarchar(50) ,
sls_order_dt NVARCHAR(50),
sls_ship_dt NVARCHAR(50),
sls_due_dt NVARCHAR(50),
sls_sales INT ,
sls_quantity INT ,
sls_price INT
);

IF OBJECT_ID('bronze.erp_CUST_AZ12' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_CUST_AZ12
GO
Create Table bronze.erp_CUST_AZ12(
CID NVARCHAR(50) ,
BDATE NVARCHAR(50),
GEN NVARCHAR(50)
);

IF OBJECT_ID('bronze.erp_LOC_A101' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_LOC_A101
GO
Create Table bronze.erp_LOC_A101(
CID NVARCHAR(50) PRIMARY KEY,
CNTRY NVARCHAR(50)
);

IF OBJECT_ID('bronze.erp_PX_CAT_G1V2' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_PX_CAT_G1V2
GO
Create Table bronze.erp_PX_CAT_G1V2(
ID NVARCHAR(50) ,
CAT NVARCHAR(50),
SUBCAT NVARCHAR(50),
MAINTENACNE NVARCHAR(50)
);
