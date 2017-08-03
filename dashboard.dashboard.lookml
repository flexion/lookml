- dashboard: QPP Dashbaord
  title: QPP Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: Total NPIs in Outpatient Claims
      type: single_value
      explore: qppar__prod__latest__extract_outpatient_claims__outpatient_claims
      dimensions: [qppar__prod__latest__extract_outpatient_claims__outpatient_claims.total_npis]
    - name: Providers Submitted
      title: Providers Submitted
      model: qpp_demo
      explore: claims_submissions_join
      type: single_value
      fields: [claims_submissions_join.total_submission_npis, claims_submissions_join.total_outpatient_claim_npis]
      limit: 1000
      column_limit: 50
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: Total Outpatient Claim Providers
    - name: Value of Processed Outpatient Claims
      type: single_value
      explore: qppar__prod__latest__extract_outpatient_claims__outpatient_claims
      dimensions: [qppar__prod__latest__extract_outpatient_claims__outpatient_claims.total_claims_amt]
    - name: Value of Processed Inpatient Claims
      type: single_value
      explore: qppar__prod__latest__extract_inpatient_claims__inpatient_claims
      dimensions: [qppar__prod__latest__extract_inpatient_claims__inpatient_claims.total_claims_amt]
    - name: Total Value of Processed Claims
      type: single_value
      explore: claims_totals
      dimensions: [claims_totals.total_claims_amt]
    - name: Claims amt per NPI
      type: table
      explore: claims_per_npi
      dimensions: [claims_per_npi.total_claims_amt, claims_per_npi.npi]
