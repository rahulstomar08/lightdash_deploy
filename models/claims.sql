SELECT
    "Policy No",
    UPPER("PAR / Non-Par / ULIP - Level/Increasing") as LOB,
    "S.No",
    "Claim Amount  (BASE + RIDER)",
    "Servicing Branch Name",
    "Channel-1",
    "Early/Non Early",
    "Writing Agent State Name",
    "Nature of Base Policy"
FROM {{ source("DB_01","CLAIMSDEC")}}
WHERE "Claim Amount  (BASE + RIDER)" NOT LIKE '%-%'




