select 

    POLICY_NO,
    TRY_TO_DATE(REPUDIATION_DATE_SETTLEMENT_DATE::VARCHAR,'dd-mm-yyyy') as Settlement_Date
    
FROM {{ source("DB_01","CLAIMSDEC")}}
