view: carrier_claims_count {
  derived_table: {
    sql: SELECT
        count(*)
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

  dimension: count1 {
    type: number
    sql: ${TABLE}.`count(1)` ;;
  }

  dimension: total_claims_buckets {
    type: tier
    tiers: [0,100,200,300,400,500,600]
    sql: ${TABLE}.`count(1)` ;;
  }

  set: detail {
    fields: [count1]
  }
}
