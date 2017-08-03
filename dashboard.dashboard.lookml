- dashboard: dashboard
  title: Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: Claims amt per NPI
      type: table
      explore: claims_per_npi
      dimensions: [claims_per_npi.total_claims_amt, claims_per_npi.npi]
    - name: Total Value of Processed Claims
      type: looker_single_record
      explore: claims_totals
      dimensions: [claims_totals.total_claims_amt]
    - name: Total NPIs submitted
      type: looker_single_record
      explore: qppar__prod__latest__submissions_transformed__submissions
      dimensions: [qppar__prod__latest__submissions_transformed__submissions.total_npis]
