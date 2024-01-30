--Create new database named 'Amazon_DB'
CREATE DATABASE Amazon_DB
USE Amazon_DB   --use database

-- See data after loading in SSMS
SELECT * FROM [dbo].[Amazon Sales data]

--Data Cleaning and Extracting data from the columns:-

-- Change  columns name where there is space between words:-
EXEC sp_rename '[dbo].[Amazon Sales data].[Item Type]', 'Item_Type', 'column'             --Item Type
EXEC sp_rename '[dbo].[Amazon Sales data].[Sales Channel]', 'Sales_Channel', 'column'     -- Sales Channel
EXEC sp_rename '[dbo].[Amazon Sales data].[Order Priority]', 'Order_Priority', 'column'   -- Order Priority
EXEC sp_rename '[dbo].[Amazon Sales data].[Order Date]', 'Order_Date', 'column'           -- Order Date
EXEC sp_rename '[dbo].[Amazon Sales data].[Order ID]', 'Order_ID', 'column'               -- Order ID
EXEC sp_rename '[dbo].[Amazon Sales data].[Ship Date]', 'Ship_Date', 'column'             -- Ship Date
EXEC sp_rename '[dbo].[Amazon Sales data].[Units Sold]', 'Units_Sold', 'column'           -- Units Sold
EXEC sp_rename '[dbo].[Amazon Sales data].[Unit Price]', 'Unit_Price', 'column'           -- Unit Price
EXEC sp_rename '[dbo].[Amazon Sales data].[Unit Cost]', 'Unit_Cost', 'column'             -- Unit Cost
EXEC sp_rename '[dbo].[Amazon Sales data].[Total Revenue]', 'Total_Revenue', 'column'     -- Total Revenue
EXEC sp_rename '[dbo].[Amazon Sales data].[Total Cost]', 'Total_Cost', 'column'           -- Total Cost
EXEC sp_rename '[dbo].[Amazon Sales data].[Total Profit]', 'Total_Profit', 'column'       -- Total Profit

-- Change the datatype of Order_Date column from VARCHAR to DATE
ALTER TABLE [dbo].[Amazon Sales data]
ALTER COLUMN Order_Date DATE

--Change the datatype of Ship_Date column from VARCHAR to DATE
ALTER TABLE [dbo].[Amazon Sales data]
ALTER COLUMN Ship_Date DATE

-- Add new column named: Order_Day_Name
ALTER TABLE [dbo].[Amazon Sales data]
ADD Order_Day_Name VARCHAR(100)

-- Extract Order Day Name and store in new column named: Order_Day_Name
UPDATE [dbo].[Amazon Sales data] SET Order_Day_Name = FORMAT(Order_Date, 'dddd')


--Add new column named: Order_Month_Name
ALTER TABLE [dbo].[Amazon Sales data]
ADD Order_Month_Name VARCHAR(100)

--Extract Order Month Name and store in new column named: Order_Month_Name
UPDATE [dbo].[Amazon Sales data] SET Order_Month_Name = FORMAT(Order_Date, 'MMMM')


--Add new column named: Order_Day_Number
ALTER TABLE [dbo].[Amazon Sales data]
ADD Order_Day_Number INT 

--Extract Order_Day_Number and store in new column named: Order_Day_Number
UPDATE [dbo].[Amazon Sales data] SET Order_Day_Number = FORMAT(Order_Date, 'dd')


--Add new column named: Order_Month_Number
ALTER TABLE [dbo].[Amazon Sales data]
ADD Order_Month_Number INT 

--Extract Order_Day_Number and store in new column named: Order_Month_Number
UPDATE [dbo].[Amazon Sales data] SET Order_Month_Number = FORMAT(Order_Date, 'MM')


--Add new column named: Order_Year
ALTER TABLE [dbo].[Amazon Sales data]
ADD Order_Year INT 

--Extract Order_Day_Number and store in new column named: Order_Year
UPDATE [dbo].[Amazon Sales data] SET Order_Year = FORMAT(Order_Date, 'yyyy')



-- Add new column named: Ship_Day_Name
ALTER TABLE [dbo].[Amazon Sales data]
ADD Ship_Day_Name VARCHAR(100)

-- Extract Order Day Name and store in new column named: Ship_Day_Name
UPDATE [dbo].[Amazon Sales data] SET Ship_Day_Name = FORMAT(Ship_Date, 'dddd')


--Add new column named: Ship_Month_Name
ALTER TABLE [dbo].[Amazon Sales data]
ADD Ship_Month_Name VARCHAR(100)

--Extract Order Month Name and store in new column named: Ship_Month_Name
UPDATE [dbo].[Amazon Sales data] SET Ship_Month_Name = FORMAT(Ship_Date, 'MMMM')


--Add new column named: Ship_Day_Number
ALTER TABLE [dbo].[Amazon Sales data]
ADD Ship_Day_Number INT 

--Extract Order_Day_Number and store in new column named: Ship_Day_Number
UPDATE [dbo].[Amazon Sales data] SET Ship_Day_Number = FORMAT(Ship_Date, 'dd')


--Add new column named: Ship_Month_Number
ALTER TABLE [dbo].[Amazon Sales data]
ADD Ship_Month_Number INT 

--Extract Order_Day_Number and store in new column named: Ship_Month_Number
UPDATE [dbo].[Amazon Sales data] SET Ship_Month_Number = FORMAT(Ship_Date, 'MM')


--Add new column named: Ship_Year
ALTER TABLE [dbo].[Amazon Sales data]
ADD Ship_Year INT 

--Extract Order_Day_Number and store in new column named: Ship_Year
UPDATE [dbo].[Amazon Sales data] SET Ship_Year = FORMAT(Ship_Date, 'yyyy')


-- Dealing with Order_Priority column
UPDATE [dbo].[Amazon Sales data]
SET 
    Region = Region,
    Country = Country,
    Item_Type = Item_Type,
    Sales_Channel = Sales_Channel,
    Order_Date = Order_Date,
    Order_ID = Order_ID,
    Ship_Date = Ship_Date,
    Units_Sold = Units_Sold,
    Unit_Price = Unit_Price,
    Unit_Cost = Unit_Cost,
    Total_Revenue = Total_Revenue,
    Total_Cost = Total_Cost,
    Total_Profit = Total_Profit,
    Order_Priority = 
        CASE 
            WHEN Order_Priority = 'H' THEN 'High'
            WHEN Order_Priority = 'M' THEN 'Medium'
            WHEN Order_Priority = 'L' THEN 'Low'
            WHEN Order_Priority = 'C' THEN 'Cancel'
        END


--Change the Units_Sold datatype from varcar to int
ALTER TABLE [dbo].[Amazon Sales data] ALTER COLUMN Units_Sold INT


--Change the Unit_Price datatype from varchar to Float
ALTER TABLE [dbo].[Amazon Sales data] ALTER COLUMN Unit_Price DECIMAL(10,2)

--Change the Unit_Cost datatype from varchar to Float
ALTER TABLE [dbo].[Amazon Sales data] ALTER COLUMN Unit_Cost DECIMAL(10,2)


-- Change the Total_Revenue datatype from varchar to Float
ALTER TABLE [dbo].[Amazon Sales data] ALTER COLUMN Total_Revenue DECIMAL(10, 2)


--Change the Total_Cost datatype from varchar to Float
ALTER TABLE [dbo].[Amazon Sales data] ALTER COLUMN Total_Cost DECIMAL(10,2)


--Change the Total_Profit datatype from varchar to Float
ALTER TABLE [dbo].[Amazon Sales data] ALTER COLUMN Total_Profit DECIMAL(10,2)


-- After cleaning the raw:-
SELECT * FROM [dbo].[Amazon Sales data]
