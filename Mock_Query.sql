-- Purpose mock query to show each SQL functions in relation to MSSQL Server syntax and order 

-- SELECT Clause Functions
SELECT
    COUNT(Column1) AS TotalCount,
    SUM(Column2) AS TotalSum,
    AVG(Column3) AS AverageValue,
    MIN(Column4) AS MinValue,
    MAX(Column5) AS MaxValue
FROM YourTable;

-- String Functions
SELECT
    LEN(ColumnName) AS StringLength,
    LEFT(ColumnName, 3) AS LeftSubstring,
    RIGHT(ColumnName, 2) AS RightSubstring,
    CHARINDEX('substring', ColumnName) AS SubstringPosition,
    SUBSTRING(ColumnName, 2, 4) AS ExtractedSubstring
FROM YourTable;

-- Date and Time Functions
SELECT
    GETDATE() AS CurrentDateTime,
    DATEDIFF(DAY, StartDate, EndDate) AS DateDifference,
    DATEADD(MONTH, 3, DateColumn) AS DatePlusThreeMonths,
    FORMAT(DateColumn, 'yyyy-MM-dd') AS FormattedDate
FROM YourTable;

-- Aggregation Functions
SELECT
    GroupingColumn,
    COUNT(*) AS TotalCount,
    AVG(NumericColumn) AS AverageValue,
    MIN(AnotherColumn) AS MinValue,
    MAX(YetAnotherColumn) AS MaxValue
FROM YourTable
GROUP BY GroupingColumn
HAVING COUNT(*) > 1;

-- Conditional Functions
SELECT
    Column1,
    Column2,
    CASE
        WHEN Condition1 THEN 'Result1'
        WHEN Condition2 THEN 'Result2'
        ELSE 'DefaultResult'
    END AS CustomColumn
FROM YourTable;

-- Join Functions
SELECT
    t1.Column1,
    t1.Column2,
    t2.Column3
FROM Table1 t1
INNER JOIN Table2 t2 ON t1.ID = t2.Table1ID;

-- Window Functions
SELECT
    Column1,
    Column2,
    ROW_NUMBER() OVER (ORDER BY Column1) AS RowNum,
    RANK() OVER (PARTITION BY Category ORDER BY Sales DESC) AS SalesRank
FROM YourTable;

-- System Functions
SELECT
    @@VERSION AS ServerVersion,
    DB_NAME() AS CurrentDatabase,
    OBJECT_ID('YourTable') AS TableObjectID
FROM YourTable;
