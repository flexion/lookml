view: claims_per_npi {
  derived_table: {
    sql: SELECT
        sum(claims.clm_pmt_amt) AS total_claims_amt,
        claims.at_physn_npi AS npi
      FROM default.qppar__prod__latest__extract_inpatient_claims__inpatient_claims AS claims
      where at_physn_npi is not null
      AND clm_pmt_amt > 0
      GROUP BY claims.at_physn_npi
      ORDER BY sum(clm_pmt_amt) DESC
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_claims_amt {
    type: number
    sql: ${TABLE}.total_claims_amt ;;
    value_format_name: usd
  }

  dimension: npi {
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: total_claims_buckets {
    type: tier
    tiers: [0,30000,100000000]
    sql: ${TABLE}.total_claims_amt ;;
    value_format_name: usd
  }

  set: detail {
    fields: [total_claims_amt, npi]
  }
}
