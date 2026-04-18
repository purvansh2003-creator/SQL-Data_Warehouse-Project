/* 
====================================================================================

CREATE DATABASE AND SCHEMAS

====================================================================================

Script Purpose :
	This Script creates a new database named 'DataWarehouse' after checking if it already exists
	If the database exists , it is dropped and recreated . Additionally the Scripts sets up the
	Schemas within the Database : 'bronze' , 'silver' and 'gold'

Warning ! :
	Running this script will create a new database and all the data in old database , if exists
	will be permanently deleted . Make sure you have Proper backup before running this script

*/

--- Create Database 'DataWarehouse' ---

Use Master; 
Go 
-- Drop and Recreate the 'DataWarehouse' Database --
If Exists ( select 1 from sys.databases where name = 'DataWarehouse')
begin 
	Alter Database DataWarehouse Set Single_User WITH ROLLBACK IMMEDIATE;
	DROP Database DataWarehouse;
End;
-- Create the "DataWarehouse" Database --
Go
CREATE DATABASE DataWarehouse;
Go
Use DataWarehouse;
-- Create the Schemas --
Go
create schema bronze;
Go
create schema silver;
Go
create schema gold;
