select INTIMATION_DATE ,
        sum(CLAIM_AMOUNT) as sum_amt_claim
       FROM {{ source("DB_01","claims")}} 
       group by INTIMATION_DATE 
