

-- Total Revenue per Country
SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM OnlineRetail
GROUP BY Country
ORDER BY TotalRevenue DESC;


-- Average Quantity per Product
SELECT Description, AVG(Quantity) AS AvgQuantity
FROM OnlineRetail
GROUP BY Description;


-- Top 5 Customers by Spend
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpend
FROM OnlineRetail
GROUP BY CustomerID
ORDER BY TotalSpend DESC
LIMIT 5;


-- Products Sold More Than 5000 Units
SELECT Description, SUM(Quantity) AS TotalSold
FROM OnlineRetail
GROUP BY Description
HAVING SUM(Quantity) > 5000;


-- Monthly Revenue
SELECT strftime('%Y-%m', InvoiceDate) AS Month, SUM(Quantity * UnitPrice) AS Revenue
FROM OnlineRetail
GROUP BY Month
ORDER BY Month;

	
-- Count of Unique Invoices per Country
SELECT Country, COUNT(DISTINCT InvoiceNo) AS NumInvoices
FROM online_retail
GROUP BY Country
ORDER BY NumInvoices DESC;



-- Total Orders, Products, and Revenue
SELECT 
    COUNT(DISTINCT InvoiceNo) AS TotalOrders,
    COUNT(DISTINCT StockCode) AS TotalProducts,
    ROUND(SUM(Quantity * UnitPrice), 2) AS TotalRevenue
FROM online_retail;


-- Most Sold Product in Each Country
SELECT Country, Description, SUM(Quantity) AS TotalSold
FROM online_retail
GROUP BY Country, Description
ORDER BY Country, TotalSold DESC;


--   Product with Highest Revenue
SELECT Description, ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM online_retail
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 1;

