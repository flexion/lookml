view: claims_totals {
   derived_table: {
     sql: SELECT
         at_physn_npi as npi
         , clm_pmt_amt as clm_pmt_amt
       FROM (
        SELECT at_physn_npi, clm_pmt_amt FROM default.qppar__prod__latest__extract_outpatient_claims__outpatient_claims
        UNION ALL
        SELECT at_physn_npi, clm_pmt_amt FROM default.qppar__prod__latest__extract_inpatient_claims__inpatient_claims )
        LIMIT 100
       ;;
   }

   dimension: npi {
     description: "National Provider Identifier"
     type: number
     sql: ${TABLE}.npi ;;
   }

   dimension: clm_pmt_amt {
     description: "The dollar amount of each claim"
     type: number
     sql: ${TABLE}.clm_pmt_amt ;;
   }

   measure: total_claims_amt {
     description: "Total dollar amount paid out in claims"
     type: sum
     sql: ${clm_pmt_amt} ;;
   }

  measure: total_npis {
    description: "Total number of npis in the system"
    type: count_distinct
    sql: ${npi} ;;
  }
}
