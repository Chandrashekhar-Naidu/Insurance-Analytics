CREATE DATABASE insurance_dashboard;
USE insurance_dashboard;
-- Yearly Meeting Count ------------
SELECT 
  YEAR(meeting_date) AS year,
  COUNT(*) AS meeting_count
FROM meeting
GROUP BY YEAR(meeting_date)
order by  year desc;
-------------------------------------------------------------------------------------------------------------

-- No of meeting count by account executive----
SELECT 

  `Account_Executive`,
  COUNT(*) AS meeting_count
FROM meeting
GROUP BY `Account_Executive`;
----------------------------------------------------------------------------------------------------------------------------------
UPDATE meeting
SET meeting_date = STR_TO_DATE(meeting_date, '%d-%m-%Y');

select * from meeting;
----------------------------------------------------------------------------------------------------------------------------------

-- No of Invoice by Account Executive --
SELECT 
  `Account_Executive`,
  COUNT(*) AS invoice_count
FROM invoice
GROUP BY `Account_Executive`;
----------------------------------------------------------------------------------------------------------------------------------
-- KPI 4: Total Opportunities--
SELECT 
    COUNT(opportunity_id) AS total_opportunities
FROM opportunity;
----------------------------------------------------------------------------------------------------------------------------------
-- Total Open Opportunities--
SELECT 
    COUNT(opportunity_id) AS total_open_opportunities
FROM opportunity
WHERE stage != 'Closed';
----------------------------------------------------------------------------------------------------------------------------------
-- Top 4 Opportunities by Revenue
SELECT 
    product_group,
    SUM(revenue_amount) AS total_revenue
FROM opportunity
GROUP BY product_group
ORDER BY total_revenue DESC
LIMIT 4;

----------------------------------------------------------------------------------------------------------------------------------
-- Stage Funnel by Revenue---
SELECT 
    stage,
    SUM(revenue_amount) AS total_revenue
FROM opportunity
GROUP BY stage
ORDER BY total_revenue DESC;
----------------------------------------------------------------------------------------------------------------------------------
-- Opportunity Product Distribution
SELECT 
    product_group,
    COUNT(opportunity_id) AS opportunity_count
FROM opportunity
GROUP BY product_group
ORDER BY opportunity_count DESC;
----------------------------------------------------------------------------------------------------------------------------------
-- Top 4 Open Opportunity ----
SELECT  
 opportunity_name,
  `Account_Executive`,
  revenue_amount,
  stage
FROM opportunity
WHERE stage IN ('Propose Solution', 'Qualify Opportunity')
ORDER BY revenue_amount DESC
LIMIT 4;
