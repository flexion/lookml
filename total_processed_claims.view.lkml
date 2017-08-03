view: total_processed_claims {
   derived_table: {
     sql: SELECT sum(outpatient_claims.clm_pmt_amt) AS total_claims_amt
      FROM default.qppar__prod__latest__extract_outpatient_claims__outpatient_claims AS outpatient_claims
       ;;
   }

   dimension: total_claims_amt {
     description: "Total outpatient claims"
     type: number
     sql: ${TABLE}.total_claims_amt ;;
   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
 }
