view: outpatient_claims_totals_by_date {
  derived_table: {
    sql: SELECT
        DATE_FORMAT(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date , 'yyyy-MM-dd') AS claims_date,
        qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.claim_paid_amount  AS clm_pmt_amt
      FROM default.qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean  AS qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean

      GROUP BY DATE_FORMAT(qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.end_date , 'yyyy-MM-dd'),qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean.claim_paid_amount
      LIMIT 500
       ;;
  }

  dimension: claim_date {
    description: "Claim Date"
    type: date
    sql: ${TABLE}.claims_date ;;
  }

  dimension: clm_pmt_amt {
    description: "The dollar amount of each claim"
    type: number
    sql: ${TABLE}.clm_pmt_amt ;;
  }

  measure: total_claims_amt_for_date {
    description: "Total dollar amount paid out in claims on this date"
    type: sum
    sql: ${clm_pmt_amt} ;;
    value_format_name: usd
  }
}
