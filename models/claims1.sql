select 

    POLICY_NO,
    TRY_TO_DATE(REPUDIATION_DATE_SETTLEMENT_DATE::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    CLAIM_AMOUNT
    
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE CLAIM_AMOUNT NOT LIKE '%-%'
