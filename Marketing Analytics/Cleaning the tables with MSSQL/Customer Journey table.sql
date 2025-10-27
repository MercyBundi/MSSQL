USE Marketing_Analytics
GO


SELECT *
FROM dbo.customer_journey;

-- Using Common Table Expression (CTE) to identify and tag duplicate records

WITH DuplicateRecords AS (
	SELECT *,
		ROW_NUMBER() OVER(
						PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
						ORDER BY JourneyID
							) AS row_num
	FROM dbo.customer_journey
)

-- Select all records from CTE where row_num > 1,which indicates the duplicate entries
SELECT *
FROM DuplicateRecords
WHERE row_num > 1
ORDER BY JourneyID;



-- Ouery for the final cleaned and standardized data
SELECT 
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	COALESCE(Duration, avg_duration) AS Duration   -- Replaces missing durations with the average duration for the corresponding
FROM
	(	SELECT            -- Subquery to process and clean the data
				JourneyID,
				CustomerID,
				ProductID,
				VisitDate,
				UPPER(Stage) AS Stage,
				Action,
				Duration,
				AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration,  -- Calculates the average duration for each date
				ROW_NUMBER() OVER (
								PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action  -- Groups by this columns to find duplicate 
								ORDER BY journeyID
								) AS row_num -- 
		FROM dbo.customer_journey
	) AS subquery

WHERE row_num = 1;