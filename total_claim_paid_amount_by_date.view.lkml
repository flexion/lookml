view: total_claim_paid_amount_by_date {
  derived_table: {
    sql: SELECT
          DATE_FORMAT(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date, 'yyyy-MM-dd') as date_formatted,
          sum(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.claim_paid_amount)
        FROM default.qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean  AS qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean
        GROUP BY qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date
        limit 10000
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: end_date {
    type: date
    sql: ${TABLE}.date_formatted ;;
  }

  dimension: sumclaim_paid_amount {
    type: number
    sql: ${TABLE}.`sum(claim_paid_amount)` ;;
  }

  set: detail {
    fields: [end_date, sumclaim_paid_amount]
  }
}
