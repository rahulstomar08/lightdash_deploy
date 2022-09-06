select 

    "Policy No" AS POLICY_NO,
    TRY_TO_DATE("Repudiation Date/ Settlement Date"::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    "Claim Amount  (BASE + RIDER)",
    (CASE WHEN EXTRACT(MONTH from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    "Channel-1" AS CHANNEL,
    "Early/Non Early" AS EARLY_NON_EARLY,
    "Writing Agent State Name" AS WRITING_AGENT_STATE_NAME,
    UPPER("PAR / Non-Par / ULIP - Level/Increasing") as LOB
    
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE "Claim Amount  (BASE + RIDER)" NOT LIKE '%-%'
