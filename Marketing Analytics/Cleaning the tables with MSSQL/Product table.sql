USE Marketing_Analytics
GO

SELECT *
FROM dbo.products;

--

-- I want to categorize the products depending on their prices

--First i check the minimum and maximum value
SELECT
	MIN(Price) AS Lowest_Price,
	MAX(Price) AS Highest_Price
FROM dbo.products;


--Now i categorize the products by their price
SELECT
	ProductId,
	ProductName,
	Price,

	CASE
		WHEN Price < 50 THEN 'Low'
		WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END AS Price_Category

FROM dbo.products;

