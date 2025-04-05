use Amazon;
-- Q1) What is the count of distinct cities in the dataset?
SELECT COUNT(DISTINCT City) AS Unique_Cities_count  -- Here COUNT() Aggregrate fuction has used to counting and " DISTINCT " will help to identify only unique Cities
FROM Amazon_Data;


-- Q2) For each branch , what is the corresponding city?
SELECT Branch , City  -- Here Branch situated in corresponding cities has calculated by using GROUP BY clause and output is ordered in ascending w.r.t. branch. 
FROM Amazon_Data
group by Branch,City
order by Branch asc;


-- Q3) What is the count of distinct product lines in the dataset?
Select COUNT(DISTINCT Product_Line) AS Product_Line_Count -- COUNT function and DISTINCT  has used to count unique product line 
from Amazon_Data;


-- Q4) Which payment method occurs most freqently?
Select Payment , COUNT(*) AS Pay_Count  -- COUNT function is used to count total number of payment methods
from Amazon_Data
group by Payment
order by pay_Count Desc -- it orders the payment count in descending order 
Limit 1; -- it will return the first row only and due to order by first row contains maximum count value 


-- Q5) Which product line has the highest sales?
SELECT Product_Line , SUM(Total) AS High_Sales -- SUM function here adding all the total sales value of each product line
FROM Amazon_Data
GROUP BY Product_Line -- group by is used to group all total value w.r.t product line 
ORDER BY High_Sales desc -- it arrange total sales of each product line in descending order 
LIMIT 1; -- it will return only the first row which contains maximum sales value


-- Q6) How much revenue is generated each month?
SELECT monthname, SUM(Total) AS Revenue_per_Month  -- SUM function is used to calculate total revenue
FROM Amazon_Data
GROUP BY monthname -- here grouping done according to monthname
ORDER BY Revenue_per_Month DESC;


-- Q7) In which month did the cost of goods sold reach its peak?
SELECT monthname, SUM(cogs) AS Max_cogs  -- SUM function adding COG value of each month
FROM Amazon_Data
GROUP BY monthname
ORDER BY Max_cogs DESC -- sorting total cogs per month in descending order
LIMIT 1; -- selecting the month in which maximum cogs has reached


-- Q8) Which product line generated the highest revenue?
SELECT Product_Line, SUM(Total) AS Max_revenue -- sum function adding total  to calculate total price for each product line
FROM Amazon_Data
GROUP BY Product_Line -- grouping according to the product line
ORDER BY Max_revenue DESC -- sorting the calculated revenue of all product line
LIMIT 1; -- selecting the product line which has generated maximum revenue 



-- Q9) In which city was the highest revenue recorded?
SELECT City, SUM(Total) AS Revenue_Sum -- Sum function is used to calculate total revenue per city
FROM Amazon_Data
GROUP BY City -- grouping the revenue according to city
ORDER BY Revenue_Sum DESC -- sorting total revenue of each city in descending order
LIMIT 1; -- selecting the city which generated maximum revenue



-- Q10) Which product line incurred the highest Value Added Tax?
SELECT Product_Line, SUM(VAT) AS VAT_Sum -- Sum function calculating total VAT icurred by each product line
FROM Amazon_Data
GROUP BY Product_Line -- grouping total VAT according to the product line 
ORDER BY VAT_Sum DESC -- sorting total VAT in descending order 
LIMIT 1; -- selecting the product line which icurred maximum VAT



-- Q11) For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
with Product_Des as (                            -- A Common Table Expression "ProductSales" is made here to fetch product line and their sum toal
select Product_Line,sum(Total) as Total_Sales
from Amazon_Data
group by Product_Line
),
Performance_Sales as(                 -- another CTE "Overall Average is used to fetch average from total sales obtained by first CTE"
select Product_Line,CASE
        WHEN Total_Sales > (SELECT AVG(Total_Sales) FROM Product_Des ) 
        THEN 'Good'
        ELSE 'Bad'
    END AS Product_Line_Grade
from Product_Des
)
select PD.Product_Line,Total_Sales,Product_Line_Grade 
from Product_Des PD inner join Performance_Sales PS
on PD.Product_Line = PS.Product_Line;  -- if total sales exceeds the average sales then perforance is ranked good

-- Q12)  Identify the branch that exceeded the average number of products sold.
SELECT Branch, SUM(Quantity) AS Quantity_Sold    -- total quantity is calculated by using SUM function
FROM Amazon_Data
GROUP BY Branch -- grouping them according to each branch 
HAVING Quantity_Sold > (SELECT AVG(Quantity) FROM Amazon_Data) -- calculating total qantity which has exceeded average quantity 
LIMIT 1;

-- Q13) Which product line is most frequently associated with each gender?
SELECT Product_Line , Gender , COUNT(*) AS Product_Preference
FROM Amazon_Data
GROUP BY Product_Line , Gender
ORDER BY  Product_Line ASC ,Product_Preference DESC; 

-- Q14) Calculate the average rating for each product line. 
SELECT Product_Line , AVG(Rating) AS Product_Avg_Rating
from Amazon_Data
group by Product_Line
order by Product_Line; 
 
-- Q15) Count the sales occurances for each time of day on every weekday. 
SELECT dayname, timeofday , COUNT(Total) AS Sales_as_Time   -- I am considering here Sunday and Saturday as weekend and rest as weekdays. 
FROM Amazon_Data
GROUP BY dayname, timeofday 
HAVING dayname NOT IN ("Sunday","Saturday")
ORDER BY dayname, timeofday ;

-- Q16) Identify the customer type contributing the highest revenue. 
SELECT Customer_Type, SUM(Total) AS Total_Revenue
FROM Amazon_Data
GROUP BY Customer_Type
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Q17) Determine the city with highest VAT percentage. 
SELECT City, MAX((VAT/Total) * 100) AS Highest_VAT
FROM Amazon_Data
GROUP BY City 
ORDER BY Highest_VAT DESC
LIMIT 1;

-- Q18) Identify the customer type with the highest VAT payments. 
SELECT Customer_Type, SUM(VAT) Total_VAT 
FROM Amazon_Data 
GROUP BY Customer_Type
ORDER BY Total_VAT DESC
LIMIT 1; 

-- Q19) What is the count of distinct customer types in the dataset?
SELECT COUNT(DISTINCT Customer_Type) AS UNIQUE_CUST_TYPE
FROM Amazon_Data ; 

-- Q20) What is the count of distinct payment methods in the dataset?
SELECT COUNT(DISTINCT Payment) AS UNIQUE_PAY_METHOD
FROM Amazon_Data ; 

-- Q21) Which customer type occurs most frequently?
SELECT Customer_Type, COUNT(Customer_Type) AS CUST_TYPE_OCCURANCE
FROM Amazon_Data
GROUP BY Customer_Type
ORDER BY CUST_TYPE_OCCURANCE DESC
LIMIT 1;

-- Q22) Identify the customer type with the highest purchase frequency. 
SELECT Customer_Type , COUNT(Invoice_ID) AS PURCHASE_COUNT
FROM Amazon_Data 
GROUP BY Customer_Type 
ORDER BY PURCHASE_COUNT DESC
LIMIT 1 ; 

-- Q23) Determine the predominant gender among customers. 
SELECT Gender , COUNT(Gender) AS Count_Genderwise
FROM Amazon_Data 
GROUP BY Gender
ORDER BY Count_Genderwise DESC 
LIMIT 1; 

-- Q24) Examine the distribution of genders within each branch. 
SELECT Branch, Gender, COUNT(Gender) AS Gen_Count
FROM Amazon_Data
GROUP BY Branch , Gender 
ORDER BY  Branch ;

-- Q25) Identify the time of day when customers provide the most ratings. 
SELECT timeofday, COUNT(Rating) AS Max_Rate
FROM Amazon_Data
GROUP BY timeofday
ORDER BY Max_Rate DESC; 
-- Q26) Determine the time of day with the highest customer ratings for each branch. 
WITH Max_Cust_Ranking AS (
    SELECT
        Branch,
        timeofday,
        MAX(Rating) AS Highest_Rating,
        RANK() OVER (PARTITION BY Branch ORDER BY MAX(Rating) DESC) AS Rank_Time
    FROM Amazon_Data
    GROUP BY branch, timeofday
)
SELECT branch, timeofday, Highest_Rating
FROM Max_Cust_Ranking
WHERE Rank_Time = 1; 

-- Q27) Identify the day of the week with the highest average ratings. 
SELECT dayname , AVG(Rating) AS AVG_RATING
FROM Amazon_Data
GROUP BY dayname
order by AVG_RATING DESC
LIMIT 1;

-- Q28) Determine the day of the week with the highest average ratings for each branch. 
WITH High_Avg_Rate AS (
    SELECT
        Branch,
        dayname,
        AVG(Rating) AS AVG_Rating,
        RANK() OVER (PARTITION BY Branch ORDER BY AVG(Rating) DESC) AS Day_Ranking
    FROM Amazon_Data
    GROUP BY branch, dayname
)
SELECT branch, dayname, AVG_Rating
FROM High_Avg_Rate
WHERE Day_Ranking = 1; 


