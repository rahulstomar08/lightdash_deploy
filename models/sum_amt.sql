SELECT 
     month_ho,Fiscal_year,
     ROUND(SUM(CLAIM_AMOUNT/10000000),1) AS CLAIM_AMOUNTS
FROM {{ source("DB_01","claims")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
GROUP BY month_ho,Fiscal_year
order by month_ho