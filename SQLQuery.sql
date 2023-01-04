--Total Arrivals and Departures per hour for Incontrol_data
SELECT CAST(Check_In as date) AS "Day",
       DATEPART(hour, Check_In) AS "Hour",
       COUNT(*) AS Total_Arrivals
FROM Project.dbo.Incontrol_data
GROUP BY CAST(Check_In as date),
       DATEPART(hour, Check_In)
	   Order BY CAST(Check_In as date) ASC



SELECT CAST(Departure as date) AS "Day",
       DATEPART(hour, Departure) AS "Hour",
       COUNT(*) AS Total_Departures
FROM Project.dbo.Incontrol_data
GROUP BY CAST(Departure as date),
       DATEPART(hour, Departure)
	   Order BY CAST(Departure as date) ASC


--Total Arrivals and Departures per hour for Test_data_1
SELECT CAST(Check_In as date) AS "Day",
       DATEPART(hour, Check_In) AS "Hour",
       COUNT(*) AS Total_Arrivals
FROM Project.dbo.Test_data_1
GROUP BY CAST(Check_In as date),
       DATEPART(hour, Check_In)
	   Order BY CAST(Check_In as date) ASC



SELECT CAST(Departure as date) AS "Day",
       DATEPART(hour, Departure) AS "Hour",
       COUNT(*) AS Total_Departures
FROM Project.dbo.Test_data_1
GROUP BY CAST(Departure as date),
       DATEPART(hour, Departure)
	   Order BY CAST(Departure as date) ASC



--Total Arrivals and Departures per hour for Test_data_2
SELECT CAST(Check_In as date) AS "Day",
       DATEPART(hour, Check_In) AS "Hour",
       COUNT(*) AS Total_Arrivals
FROM Project.dbo.Test_data_2
GROUP BY CAST(Check_In as date),
       DATEPART(hour, Check_In)
	   Order BY CAST(Check_In as date) ASC



SELECT CAST(Departure as date) AS "Day",
       DATEPART(hour, Departure) AS "Hour",
       COUNT(*) AS Total_Departures
FROM Project.dbo.Test_data_2
GROUP BY CAST(Departure as date),
       DATEPART(hour, Departure)
	   Order BY CAST(Departure as date) ASC



--Total Arrivals and Departures per hour for Test_data_3
SELECT CAST(Check_In as date) AS "Day",
       DATEPART(hour, Check_In) AS "Hour",
       COUNT(*) AS Total_Arrivals
FROM Project.dbo.Test_data_3
GROUP BY CAST(Check_In as date),
       DATEPART(hour, Check_In)
	   Order BY CAST(Check_In as date) ASC



SELECT CAST(Departure as date) AS "Day",
       DATEPART(hour, Departure) AS "Hour",
       COUNT(*) AS Total_Departures
FROM Project.dbo.Test_data_3
GROUP BY CAST(Departure as date),
       DATEPART(hour, Departure)
	   Order BY CAST(Departure as date) ASC






-------------------------PER DAY-------------------------

--Calculate Total Arrivals and Departures per day for Incontrol_data
SELECT COUNT(*) [Total_Arrivals],
       DATEPART(dd, [Check_In]) [Day]
 FROM Project.dbo.Incontrol_data
 GROUP BY DATEPART(dd, [Check_In])
 Order By Day ASC

SELECT COUNT(*) [Total_Departures],
       DATEPART(dd, [Departure]) [Day]
 FROM Project.dbo.Incontrol_data
 GROUP BY DATEPART(dd, [Departure])
 Order By Day ASC

--Now create a new table with the query results
Create Table Project.dbo.ControlArrivals (
	Day INT NOT NULL,
	Total_Arrivals INT NOT NULL,
	);
Insert Into Project.dbo.ControlArrivals (Day, Total_Arrivals)
Values
	(1, 122), 
	(2, 131), 
	(3, 123),
	(4, 137), 
	(5, 117), 
	(6, 113), 
	(7, 115),
	(8, 142)
	;

Select * From Project.dbo.ControlArrivals



--Or we can export the query results directly to a CSV using a stored procedure.
DROP PROCEDURE [export_control_arrivals_to_csv];
GO

CREATE PROCEDURE export_control_arrivals_to_csv
AS
BEGIN
    DECLARE @sql AS VARCHAR(8000);
    
    SET @sql = 'bcp "SELECT * FROM dbo.ControlArrivals" queryout "C:\Users\path\ControlArrivals.csv" -c -t, -T -S ' + @@SERVERNAME;
    
    EXECUTE xp_cmdshell @sql;
END;

EXEC export_control_arrivals_to_csv;


SELECT * INTO OUTFILE 'C:\Users\path\ControlArrivals.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM dbo.ControlArrivals;


--Total Arrivals and Departures per day for Test_data_1
SELECT COUNT(*) [Total_Arrivals],
       DATEPART(dd, [Check_In]) [Day]
 FROM Project.dbo.Test_data_1 
 GROUP BY DATEPART(dd, [Check_In])
 Order By Day ASC

SELECT COUNT(*) [Total_Departures],
       DATEPART(dd, [Departure]) [Day]
 FROM Project.dbo.Test_data_1 
 GROUP BY DATEPART(dd, [Departure])
 Order By Day ASC



--Total Arrivals and Departures per day for Test_data_2
SELECT COUNT(*) [Total_Arrivals],
       DATEPART(dd, [Check_In]) [Day]
 FROM Project.dbo.Test_data_2 
 GROUP BY DATEPART(dd, [Check_In])
 Order By Day ASC

SELECT COUNT(*) [Total_Departures],
       DATEPART(dd, [Departure]) [Day]
 FROM Project.dbo.Test_data_2 
 GROUP BY DATEPART(dd, [Departure])
 Order By DAY ASC


 --Total Arrivals and Departures per day for Test_data_3
SELECT COUNT(*) [Total_Arrivals],
       DATEPART(dd, [Check_In]) [Day]
 FROM Project.dbo.Test_data_3 
 GROUP BY DATEPART(dd, [Check_In])
 Order By Day ASC

SELECT COUNT(*) [Total_Departures],
       DATEPART(dd, [Departure]) [Day]
 FROM Project.dbo.Test_data_3
 GROUP BY DATEPART(dd, [Departure])
 Order By Day ASC





