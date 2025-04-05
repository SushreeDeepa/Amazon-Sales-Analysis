-- FEATURE ENGINEERING
-- STEP-1 Add column "timeofday" which give insight of sales in moringng , Afternoon and Evening
use amazon;
ALTER TABLE Amazon_Data ADD COLUMN timeofday VARCHAR(20);
UPDATE Amazon_Data
SET timeofday = 
CASE 
WHEN HOUR(Time) BETWEEN 6 AND 12 THEN 'Morning' -- HERE I HAVE CONSIDERED 6.00AM TO 12.00PM AS MORNING,12.00PM TO 16.00PM AS AFTERNOON OTHERS AS EVENING
WHEN HOUR(Time) BETWEEN 12 AND 16 THEN 'Afternoon'
ELSE 'Evening'
END;
SELECT * FROM Amazon_Data;

-- STEP-2 Add a new column named "dayname" that contains the extracted days of the week 
ALTER TABLE Amazon_Data ADD COLUMN dayname VARCHAR(20); -- HERE I HAVE USED "DAYNAME()" FUNCTION TO EXTRACT NAME OF DAY
UPDATE Amazon_Data
SET dayname = DAYNAME(Date);

-- STEP-3 Add a new column named "monthname" that contains the extracted months of the year
ALTER TABLE Amazon_Data ADD COLUMN monthname VARCHAR(20); -- HERE I HAVE USED "MONTHNAME()" FUNCTION TO EXTRACT NAME OF MONTH
UPDATE Amazon_Data
SET monthname = MONTHNAME(Date);


