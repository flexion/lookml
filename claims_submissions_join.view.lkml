view: claims_submissions_join {
     derived_table: {
     sql: SELECT
      outpatient_claims.at_physn_npi AS outpatient_claim_npi,
      submissions.nationalprovideridentifier AS submission_npi,
      submissions.programname AS submissions_program_name,
      submissions.taxpayeridentificationnumber AS submissions_taxpayeridentificationnumber,
      submissions.performanceyear AS submissions_performanceyear,
      submissions.measurementsets AS submissions_measurementsets,
      outpatient_claims.prvdr_num AS outpatient_provider_number,
      outpatient_claims.clm_pmt_amt AS outpatient_provider_claim_payment_amount,
      outpatient_claims.nch_prmry_pyr_clm_pd_amt AS outpatient_nch_prmry_pyr_clm_pd_amt
      FROM
      default.qppar__prod__latest__extract_outpatient_claims__outpatient_claims AS outpatient_claims
      FULL OUTER JOIN
      default.qppar__prod__latest__submissions_transformed__submissions as submissions
      ON submissions.nationalprovideridentifier = outpatient_claims.at_physn_npi
       ;;
   }

   dimension: outpatient_claim_npi {
     description: "Outpatient claims NPIs"
     type: number
     sql: ${TABLE}.outpatient_claim_npi ;;
   }

   dimension: submission_npi {
     description: "Submissions NPIs"
     type: number
     sql: ${TABLE}.submission_npi ;;
   }

  dimension: submissions_program_name {
    description: "Submissions program name"
    type: string
    sql: ${TABLE}.submissions_program_name ;;
  }

  dimension: submissions_taxpayeridentificationnumber {
    description: "Taxpayer Identification Number"
    type: number
    sql: ${TABLE}.submissions_taxpayeridentificationnumber ;;
  }

  dimension: submissions_performanceyear {
    description: "Performance year"
    type: number
    value_format: "0000"
    sql: ${TABLE}.submissions_performanceyear ;;
  }

  dimension: submissions_measurementsets {
    description: "Submission measurement sets"
    type: string
    sql: ${TABLE}.submissions_measurementsets ;;
  }

  dimension: outpatient_provider_number {
    description: "Outpatient claims provider number"
    type: number
    sql: ${TABLE}.outpatient_provider_number ;;
  }

  dimension: outpatient_provider_claim_payment_amount {
    description: "Outpatient claim payment amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.outpatient_provider_claim_payment_amount ;;
  }

  dimension: outpatient_nch_prmry_pyr_clm_pd_amt {
    description: "Outpatient claim NCH primary payer claim paid amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.outpatient_nch_prmry_pyr_clm_pd_amt ;;
  }

  measure: total_outpatient_claims_paid {
    description: "Total value paid in outpatient claims"
    type: sum
    sql: ${outpatient_provider_claim_payment_amount} ;;
  }

   measure: total_outpatient_claim_npis {
     description: "Total number of npis in outpatient claims"
     type: count_distinct
     sql: ${outpatient_claim_npi} ;;
   }

  measure: total_submission_npis {
    description: "Total number of submission npis"
    type: count_distinct
    sql: ${submission_npi} ;;
  }

 }
