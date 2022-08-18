select 

    POLICY_NO,
    TRY_TO_DATE(REPUDIATION_DATE_SETTLEMENT_DATE::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    CLAIM_AMOUNT,
    (CASE WHEN EXTRACT(MONTH from to_date(REPUDIATION_DATE_SETTLEMENT_DATE,'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(REPUDIATION_DATE_SETTLEMENT_DATE,'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date(REPUDIATION_DATE_SETTLEMENT_DATE,'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(REPUDIATION_DATE_SETTLEMENT_DATE,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year
    
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
