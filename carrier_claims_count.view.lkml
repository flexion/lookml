view: carrier_claims_count {
  derived_table: {
    sql: SELECT
        count(*) AS claims_count
      FROM default.qppar__prod__latest__transform_carrier_claims__carrier_claims_clean

      GROUP BY qppar__prod__latest__transform_carrier_claims__carrier_claims_clean.national_provider_identifier
      LIMIT 500
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_claims_buckets {
    type: tier
    tiers: [0,100,200,300,400,500,600]
    sql: ${TABLE}.claims_count ;;
  }

  set: detail {
    fields: [total_claims_buckets]
  }
}
