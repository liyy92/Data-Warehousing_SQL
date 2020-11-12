/* ALY 6030 - Group 2- Week 3 Case Study (Group Assignment)*/ 
/* Team Members: Ketaki Joshi, Yuanying Li, Tanvi Bhagat, Swetha Daddala */ 

USE aw;

/* Case 4 */ 

/* Finding the product categories */ 
SELECT * FROM aw.dimproductcategory;
/* We have four product categories. */ 

/* Finding the number of subproducts available in Accessories */ 
SELECT 
    COUNT(ProductCategoryKey) AS ' The total number of subcategories available in Accessories '
FROM
    dimproductsubcategory
WHERE
    ProductCategoryKey = 4;

/* Getting the details of the subcategory*/ 
SELECT 
    dimproductsubcategory.ProductCategoryKey,
    dimproductcategory.EnglishProductCategoryName,
    dimproductsubcategory.ProductSubcategoryKey,
    dimproductsubcategory.EnglishProductSubcategoryName,
    dimproduct.EnglishProductName,
    dimproduct.StandardCost,
    dimproduct.Status
FROM
    dimproduct
        JOIN
    dimproductsubcategory ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
        JOIN
    dimproductcategory ON dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey
WHERE
    (dimproductsubcategory.ProductCategoryKey = 4)
        AND (Status = 'Current')
ORDER BY ProductSubcategoryKey ASC; 

/* Getting the deatils of Expenditures by R&D department by each quarter */ 
SELECT 
    dimt.FiscalYear,
    dimt.FiscalQuarter,
    dimde.DepartmentGroupName,
    dimsc.ScenarioName,
    dima.AccountType,
    dima.AccountDescription,
    SUM(ff.Amount) AS 'Expenditure by each quarter'
FROM
    factfinance ff
        JOIN
    dimtime dimt ON dimt.TimeKey = ff.TimeKey
        JOIN
    dimaccount dima ON ff.AccountKey = dima.AccountKey
        JOIN
    dimscenario dimsc ON ff.ScenarioKey = dimsc.ScenarioKey
        JOIN
    dimdepartmentgroup dimde ON ff.DepartmentGroupKey = dimde.DepartmentGroupKey
WHERE
    (ff.DepartmentGroupKey = 6)
        AND (ff.ScenarioKey = 1)
        AND (dima.AccountType = 'Expenditures')
GROUP BY dima.AccountDescription , dimt.FiscalQuarter , dimt.FiscalYear
ORDER BY dima.AccountDescription , ff.TimeKey;
 
/* Comparing the expenses done by R&D department in 1st and 2nd quarter in the year 2020 */
/* Cost Growth Rate Formula = (2020_2nd cost - 2020_1st cost) / 2020_1st cost */
/* We found that cost in the 2nd quarter in the year 2020 is -20.4%, which is negetive*/
SELECT((SELECT 
  SUM(ff.Amount)
FROM factfinance ff
JOIN dimtime dimt
    ON dimt.TimeKey = ff.TimeKey
JOIN dimaccount dima
    ON ff.AccountKey = dima.AccountKey
JOIN dimscenario dimsc
	ON ff.ScenarioKey = dimsc.ScenarioKey
JOIN dimdepartmentgroup dimde
    ON ff.DepartmentGroupKey = dimde.DepartmentGroupKey
WHERE ff.DepartmentGroupKey = 6 AND ff.ScenarioKey = 1 AND dima.AccountType = "Expenditures" -- AND dimt.FiscalQuarter
GROUP BY dimt.FiscalYear, dimt.FiscalQuarter
HAVING dimt.FiscalYear = 2020 AND dimt.FiscalQuarter =2) - 
(SELECT 
  SUM(ff.Amount)
FROM factfinance ff
JOIN dimtime dimt
    ON dimt.TimeKey = ff.TimeKey
JOIN dimaccount dima
    ON ff.AccountKey = dima.AccountKey
JOIN dimscenario dimsc
	ON ff.ScenarioKey = dimsc.ScenarioKey
JOIN dimdepartmentgroup dimde
    ON ff.DepartmentGroupKey = dimde.DepartmentGroupKey
WHERE ff.DepartmentGroupKey = 6 AND ff.ScenarioKey = 1 AND dima.AccountType = "Expenditures" -- AND dimt.FiscalQuarter
GROUP BY dimt.FiscalYear, dimt.FiscalQuarter
HAVING dimt.FiscalYear = 2020 AND dimt.FiscalQuarter =1) ) / (SELECT 
  SUM(ff.Amount)
FROM factfinance ff
JOIN dimtime dimt
    ON dimt.TimeKey = ff.TimeKey
JOIN dimaccount dima
    ON ff.AccountKey = dima.AccountKey
JOIN dimscenario dimsc
	ON ff.ScenarioKey = dimsc.ScenarioKey
JOIN dimdepartmentgroup dimde
    ON ff.DepartmentGroupKey = dimde.DepartmentGroupKey
WHERE ff.DepartmentGroupKey = 6 AND ff.ScenarioKey = 1 AND dima.AccountType = "Expenditures" -- AND dimt.FiscalQuarter
GROUP BY dimt.FiscalYear, dimt.FiscalQuarter
HAVING dimt.FiscalYear = 2020 AND dimt.FiscalQuarter =1) AS 2020_2nd_quarter_inceasing_rate;

/* Case 5*/ 
/* Solution 1 : Revene details */ 
SELECT
    dimt.FiscalYear,
    dimt.FiscalQuarter,
    dimde.DepartmentGroupName,
    dimsc.ScenarioName,
    dima.AccountType,
    -- dima.AccountDescription,
    SUM(ff.Amount) AS 'Sum_Revenue'
FROM
    factfinance ff
        JOIN
    dimtime dimt ON dimt.TimeKey = ff.TimeKey
        JOIN
    dimaccount dima ON ff.AccountKey = dima.AccountKey
        JOIN
    dimscenario dimsc ON ff.ScenarioKey = dimsc.ScenarioKey
        JOIN
    dimdepartmentgroup dimde ON ff.DepartmentGroupKey = dimde.DepartmentGroupKey
WHERE
    ff.ScenarioKey = 1
        AND dima.AccountType = 'Revenue'
GROUP BY dimde.DepartmentGroupName , dimt.FiscalYear , dimt.FiscalQuarter
ORDER BY ff.DepartmentGroupKey , ff.TimeKey ASC;

/* Case 5 - solution 2- provide Internet Sales data group by year*/
SELECT 
    dimt.FiscalYear,
    dimt.FiscalQuarter,
    SUM(fis.SalesAmount) AS SUM_Revenue
FROM
    factinternetsales fis
        JOIN
    dimtime dimt ON fis.OrderDateKey = dimt.Timekey
        JOIN
    dimproduct dimp ON fis.ProductKey = dimp.ProductKey
GROUP BY dimt.FiscalYear , dimt.FiscalQuarter
ORDER BY dimt.FiscalYear , dimt.FiscalQuarter;