SELECT 
     month_ho,month_name,
     ROUND(SUM(CLAIM_AMOUNT/10000000),1) AS CLAIM_AMOUNTS
FROM {{ source("DB_01","claims")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
GROUP BY month_ho,month_name
ORDER BY (case when month_ho = 1 then 1
               when month_ho = 2 then 2
               when month_ho = 3 then 3
               when month_ho = 4 then 4
               when month_ho = 5 then 5
               when month_ho = 6 then 6
               when month_ho = 7 then 7
               when month_ho = 8 then 8
               when month_ho = 9 then 9
               when month_ho = 10 then 10
               when month_ho = 11 then 11
               when month_ho = 12 then 12 end )