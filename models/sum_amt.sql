SELECT 
     month_ho,month_name,Fiscal_year,
     ROUND(SUM(CLAIM_AMOUNT/10000000),1) AS CLAIM_AMOUNTS
FROM {{ source("DB_01","claims")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
GROUP BY month_ho,month_name,Fiscal_year
ORDER BY (CASE WHEN month_ho = 1 then 'JAN'
        WHEN month_ho = 2 then 'FEb'
        WHEN month_ho = 3 then 'MAR'
        WHEN month_ho = 4 then 'APR'
        WHEN month_ho = 5 then 'MAY'
        WHEN month_ho = 6 then 'JUNE'
        WHEN month_ho = 7 then 'JULY'
        WHEN month_ho = 8 then 'AUG'
        WHEN month_ho = 9 then 'SEP'
        WHEN month_ho = 10 then 'OCT'
        WHEN month_ho = 11 then 'NOV'
        WHEN month_ho = 12 then 'DEC') end