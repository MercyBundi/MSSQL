USE Marketing_Analytics
GO


SELECT *
FROM dbo.customers;


SELECT *
FROM dbo.geography;



-- I want the customers table to show name of geography, therefore i will join the tables
-- This is to enrich customer data to have geographical information

SELECT
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	g.City,
	g.Country

FROM dbo.customers c
JOIN dbo.geography g
	ON c.geographyID = g.geographyID;

