select 

    POLICY_NO,

    UPPER(PAR_NONPAR_ULIP_LEVELINCREASING) as LOB,

    DATE_OF_INTIMATION_HO,

    (CASE WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))<4

    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as TEXT))

    WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))>4

    THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year,

    EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as month_ho,

    SNO,

    CLAIM_AMOUNT

FROM {{ source("DB_01","CLAIMSDEC")}}