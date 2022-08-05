SELECT 
     month_ho,
     ROUND(SUM(CLAIM_AMOUNT/10000000),1) AS CLAIM_AMOUNTS,
     month_name,
     Fiscal_year
FROM {{ source("DB_01","claims")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
GROUP BY month_ho,month_name,Fiscal_year
ORDER BY month_ho