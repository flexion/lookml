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
    - name: Percent Providers Submitted
      type: single_value
      explore: claims_submissions_join
      dimensions: [claims_submissions_join.total_submission_npis, claims_submissions_join.total_outpatient_claim_npis]
    - name: Total Value of Processed Outpatient Claims
      type: single_value
      explore: qppar__prod__latest__extract_outpatient_claims__outpatient_claims
      dimensions: [qppar__prod__latest__extract_outpatient_claims__outpatient_claims.total_claims_amt]
    - name: Claims amt per NPI
      type: table
      explore: claims_per_npi
      dimensions: [claims_per_npi.total_claims_amt, claims_per_npi.npi]
