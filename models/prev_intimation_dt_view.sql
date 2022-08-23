select pre_inti_dt,
        sum(CLAIM_AMOUNT) as sum_amt_pre_claim from
(select  DATEADD(year, -1, INTIMATION_DATE) AS pre_inti_dt,
        CLAIM_AMOUNT
        FROM {{ source("DB_01","claims")}} ) group by pre_inti_dt