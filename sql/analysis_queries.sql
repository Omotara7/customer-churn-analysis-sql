CREATE DATABASE churn_analysis;
USE churn_analysis;
SELECT *
FROM churn_data
LIMIT 5;
SELECT COUNT(*) AS total_customers
FROM churn_data;
SELECT 
  AVG(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
      END) AS churn_rate
FROM churn_data;
SELECT 
  Contract,
  AVG(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
      END) AS churn_rate
FROM churn_data
GROUP BY Contract;
SELECT
  CASE
    WHEN tenure <= 12 THEN '0–12 Months'
    WHEN tenure <= 24 THEN '13–24 Months'
    ELSE '25+ Months'
  END AS tenure_group,
  AVG(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
      END) AS churn_rate
FROM churn_data
GROUP BY tenure_group;
SELECT
  Churn,
  AVG(MonthlyCharges) AS avg_monthly_charges
FROM churn_data
GROUP BY Churn;
