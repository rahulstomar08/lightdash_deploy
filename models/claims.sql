with final as ( 
    SELECT
    UPPER(PAR_NONPAR_ULIP_LEVELINCREASING) as LOB,
    TRY_TO_DATE(DATE_OF_INTIMATION_HO::VARCHAR,'dd-mm-yyyy') as Intimation_Date,
    date(dateadd(year,-1,Intimation_Date)) as Previous_Year_same_month,
    TRY_TO_DATE(REPUDIATION_DATE_SETTLEMENT_DATE::VARCHAR,'dd-mm-yyyy') as Settlement_Date,
    (CASE WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))<4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as TEXT))
    WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))>=4
    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,
    SNO,
    CLAIM_AMOUNT,
    SERVICING_BRANCH_NAME,
    CHANNEL1,
    EARLYNON_EARLY,
    WRITING_AGENT_STATE_NAME,
    NATURE_OF_BASE_POLICY
    
    FROM {{ source("DB_01","CLAIMSDEC")}}
    WHERE CLAIM_AMOUNT NOT LIKE '%-%'
    GROUP BY LOB,Intimation_Date,Previous_Year_same_month,Settlement_Date,Fiscal_year, SNO,
    CLAIM_AMOUNT,
    SERVICING_BRANCH_NAME,
    CHANNEL1,
    EARLYNON_EARLY,
    WRITING_AGENT_STATE_NAME,
    NATURE_OF_BASE_POLICY
)

select *,
LAG (SUM(CLAIM_AMOUNT),1) OVER (ORDER BY YEAR(Intimation_Date)) AS Claim_Last_Year
FROM final
GROUP BY LOB,Intimation_Date,Previous_Year_same_month,Settlement_Date,Fiscal_year, SNO,
    CLAIM_AMOUNT,
    SERVICING_BRANCH_NAME,
    CHANNEL1,
    EARLYNON_EARLY,
    WRITING_AGENT_STATE_NAME,
    NATURE_OF_BASE_POLICY





