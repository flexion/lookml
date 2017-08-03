- dashboard: dashboard
  title: Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: hello_world
      type: table
      explore: claims_per_npi
      dimensions: [claims_per_npi.total_claims_amt, claims_per_npi.npi]
