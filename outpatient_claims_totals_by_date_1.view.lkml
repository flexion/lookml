view: outpatient_claims_totals_by_date_1 {
  derived_table: {
    sql: SELECT
        DATE_FORMAT(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date , 'yyyy-MM-dd') AS qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_1,
        sum(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.claim_paid_amount)  AS qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_2
      FROM default.qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean  AS qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean

      GROUP BY DATE_FORMAT(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date , 'yyyy-MM-dd'),qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.claim_paid_amount
      LIMIT 500
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_1 {
    type: string
    sql: ${TABLE}.qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_1 ;;
  }

  dimension: qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_2 {
    type: number
    sql: ${TABLE}.qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_2 ;;
  }

  set: detail {
    fields: [qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_1, qpparprodlatesttransformoutpatientclaimsoutpatientclaimsclean_2]
  }
}
