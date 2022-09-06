SELECT
    "Policy No",
    UPPER("PAR / Non-Par / ULIP - Level/Increasing") as LOB,
    TRY_TO_DATE("Date of Intimation (HO)"::VARCHAR,'dd-mm-yyyy') as Intimation_Date,
    TRY_TO_DATE("Repudiation Date/ Settlement Date"::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    (CASE WHEN EXTRACT(MONTH from to_date("Date of Intimation (HO)",'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date("Date of Intimation (HO)",'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date("Date of Intimation (HO)",'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date("Date of Intimation (HO)",'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    "S.No",
    "Claim Amount  (BASE + RIDER)",
    "Servicing Branch Name",
    "Channel-1",
    "Early/Non Early",
    "Writing Agent State Name",
    "Nature of Base Policy"
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE "Claim Amount  (BASE + RIDER)" NOT LIKE '%-%'




