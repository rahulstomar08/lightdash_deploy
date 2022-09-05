select 

    "Policy No",
    TRY_TO_DATE("Repudiation Date/ Settlement Date"::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    "Claim Amount  (BASE + RIDER)",
    (CASE WHEN EXTRACT(MONTH from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date("Repudiation Date/ Settlement Date",'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    "Channel-1",
    "Early/Non Early",
    "Writing Agent State Name",
    UPPER("PAR / Non-Par / ULIP - Level/Increasing") as LOB
    
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE "Claim Amount  (BASE + RIDER)" NOT LIKE '%-%'
