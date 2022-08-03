select

     POLICY_NO as intimated_claims_count,

     UPPER(PAR_NONPAR_ULIP_LEVELINCREASING) as LOB,

     DATE_OF_INTIMATION_HO

     FROM {{ source("DB_01","CLAIMSDEC")}}