create database Amazon; -- New database "Amazon" has created
use Amazon;
create table Amazon_Data ( Invoice_ID VARCHAR(30) NOT NULL,Branch VARCHAR(5) NOT NULL,
 City VARCHAR(30) NOT NULL,Customer_Type VARCHAR(30) NOT NULL,Gender VARCHAR(10) NOT NULL,Product_Line VARCHAR(100) NOT NULL,
 Unit_Price DECIMAL(10,2) NOT NULL,Quantity INT NOT NULL,VAT FLOAT NOT NULL,Total DECIMAL(10,2) NOT NULL,
 date DATE NOT NULL,Time TIMESTAMP NOT NULL,Payment VARCHAR(200) NOT NULL,Cogs DECIMAL(10,2) NOT NULL,
 Gross_Margin_Percentage FLOAT NOT NULL,Gross_Income DECIMAL(10,2) NOT NULL,Rate FLOAT NOT NULL);
 select * from Amazon_Data;
-- New table "Amazon_Data" has created in which imorted csv file will be stored. 
 