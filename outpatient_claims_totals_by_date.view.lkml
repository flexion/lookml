view: outpatient_claims_totals_by_date {
  derived_table: {
    sql: SELECT
        DATE_FORMAT(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date , 'yyyy-MM-dd') AS claims_date,
        sum(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.claim_paid_amount)  AS claims_total_for_date
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

  dimension: claims_total_for_date {
    type: number
    sql: ${TABLE}.claims_total_for_date
    format: usd;;
  }

  dimension: claims_date  {
    type: date
    sql: ${TABLE}.claims_date ;;
  }

  set: detail {
    fields: [claims_total_for_date, claims_date]
  }
}
