USE Marketing_Analytics
GO


SELECT *
FROM dbo.customer_reviews;

-- Here i amgoing to clean the whitespaces
-- I am going to enusre that there is only single spacing in the RiveiwText column

SELECT
	ReviewID,
	CustomerID,
	ProductID,
	ReviewDate,
	Rating,
	REPLACE(ReviewText,'  ',' ') AS ReviewText

FROM dbo.customer_reviews;




-- saving this changes made into a new table
SELECT
	ReviewID,
	CustomerID,
	ProductID,
	ReviewDate,
	Rating,
	REPLACE(ReviewText,'  ',' ') AS ReviewText

INTO dbo.customer_reviews_cleaned
FROM dbo.customer_reviews;