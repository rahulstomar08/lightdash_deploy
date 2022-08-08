select 

    POLICY_NO,
    UPPER(PAR_NONPAR_ULIP_LEVELINCREASING) as LOB,
    DATE_OF_INTIMATION_HO,
    (CASE WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))>4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as month_ho,
    (CASE WHEN month_ho = 1 then 'JAN'
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
        WHEN month_ho = 12 then 'DEC'
        end) as month_name,
        SNO,
        CLAIM_AMOUNT
        

FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'