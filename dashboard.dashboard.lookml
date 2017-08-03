- dashboard: QPP Dashbaord
  title: QPP Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: Claims amt per NPI
      type: table
      explore: claims_per_npi
      dimensions: [claims_per_npi.total_claims_amt, claims_per_npi.npi]
    - name: Total Value of Processed Claims
      type: single_value
      explore: claims_totals
      dimensions: [claims_totals.total_claims_amt]
    - name: Total NPIs submitted
      type: single_value
      explore: qppar__prod__latest__submissions_transformed__submissions
      dimensions: [qppar__prod__latest__submissions_transformed__submissions.total_npis]
