
-- Superstore Consultation SQL Notes
-- Author: James Wesson

-- 1. Profit/Loss by Category and Sub-Category
SELECT 
    Category,
    SubCategory,
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Category, SubCategory, Region
ORDER BY Total_Profit ASC;

-- 2. Performance by Customer Segment
SELECT 
    Segment,
    SUM(Sales) AS Segment_Sales,
    SUM(Profit) AS Segment_Profit
FROM superstore_sales
GROUP BY Segment
ORDER BY Segment_Profit ASC;

-- 3. Identify High-Loss Categories
SELECT 
    SubCategory,
    ROUND(SUM(Profit), 2) AS Profit,
    COUNT(*) AS Transactions
FROM superstore_sales
GROUP BY SubCategory
HAVING SUM(Profit) < 0
ORDER BY Profit ASC;
