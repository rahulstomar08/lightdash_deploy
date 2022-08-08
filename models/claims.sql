select 

    POLICY_NO,
    UPPER(PAR_NONPAR_ULIP_LEVELINCREASING) as LOB,
    TRY_TO_DATE(DATE_OF_INTIMATION_HO::VARCHAR,'dd-mm-yyyy') as Intimation_Date,
    REPUDIATION_DATE_SETTLEMENT_DATE,
    (CASE WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as month_ho,
    EXTRACT(MONTH from to_date(REPUDIATION_DATE_SETTLEMENT_DATE,'dd-mm-yyyy')) as month_sd,
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
        (CASE WHEN month_sd = 1 then 'JAN'
        WHEN month_sd = 2 then 'FEb'
        WHEN month_sd = 3 then 'MAR'
        WHEN month_sd = 4 then 'APR'
        WHEN month_sd = 5 then 'MAY'
        WHEN month_sd = 6 then 'JUNE'
        WHEN month_sd = 7 then 'JULY'
        WHEN month_sd = 8 then 'AUG'
        WHEN month_sd = 9 then 'SEP'
        WHEN month_sd = 10 then 'OCT'
        WHEN month_sd = 11 then 'NOV'
        WHEN month_sd = 12 then 'DEC'
        end) as month_name_sd,
        SNO,
        CLAIM_AMOUNT,
        SERVICING_BRANCH_NAME
        

FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
ORDER BY month_ho