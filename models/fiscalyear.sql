SELECT (CASE WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))<4
THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy')) as TEXT))
WHEN EXTRACT(MONTH from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))>4
THEN CONCAT('FY', cast(EXTRACT(YEAR from to_date(DATE_OF_INTIMATION_HO,'dd-mm-yyyy'))+1 as TEXT)) END )AS Fiscal_year
FROM {{ source("DB_01","CLAIMSDEC")}}