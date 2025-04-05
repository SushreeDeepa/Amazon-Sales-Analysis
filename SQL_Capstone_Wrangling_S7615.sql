-- DATA WRANGLING
use Amazon;
select * from Amazon_Data;
select * 
from Amazon_Data
where Invoice_ID  IS NULL OR Branch IS NULL OR
 City IS NULL OR Customer_Type IS NULL OR Gender IS NULL OR Product_Line IS NULL OR
 Unit_Price IS NULL OR Quantity IS NULL OR VAT IS NULL OR Total IS NULL OR
 date IS NULL OR Time IS NULL OR Payment IS NULL OR Cogs IS NULL OR 
 Gross_Margin_Percentage IS NULL OR Gross_Income IS NULL ;
 select rating from Amazon_Data where rating is null;
 -- By using above condition in where clause I have checked that is there any NULL value present ? and this dataset contains zero NULL value