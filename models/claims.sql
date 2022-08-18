select 
    UPPER(PAR_NONPAR_ULIP_LEVELINCREASING) as LOB,
    TRY_TO_DATE(DATE_OF_INTIMATION_HO::VARCHAR,'dd-mm-yyyy') as Intimation_Date,
    TRY_TO_DATE(REPUDIATION_DATE_SETTLEMENT_DATE::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    (CASE WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as month_ho,
    EXTRACT(MONTH from to_date(REPUDIATION_DATE_SETTLEMENT_DATE,'dd-mm-yyyy')) as month_sd,
    SNO,
    CLAIM_AMOUNT,
    SERVICING_BRANCH_NAME,
    CHANNEL1,
    EARLYNON_EARLY,
    WRITING_AGENT_STATE_NAME,
    NATURE_OF_BASE_POLICY
    
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
ORDER BY month_ho