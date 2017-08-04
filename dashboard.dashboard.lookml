- dashboard: QPP Dashboard
  layout: newspaper
  elements:
  - name: Total npis in outpatient claims
    label: Total npis in outpatient claims
    model: qpp_demo
    explore: qppar__prod__latest__extract_outpatient_claims__outpatient_claims
    type: single_value
    fields:
    - qppar__prod__latest__extract_outpatient_claims__outpatient_claims.total_npis
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 8
  - name: Providers Submitted
    label: Providers Submitted
    model: qpp_demo
    explore: claims_submissions_join
    type: single_value
    fields:
    - claims_submissions_join.total_submission_npis
    - claims_submissions_join.total_outpatient_claim_npis
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
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 8
  - name: Value of processed outpatient claims
    label: Value of processed outpatient claims
    model: qpp_demo
    explore: qppar__prod__latest__extract_outpatient_claims__outpatient_claims
    type: single_value
    fields:
    - qppar__prod__latest__extract_outpatient_claims__outpatient_claims.total_claims_amt
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 8
  - name: Value of processed inpatient claims
    label: Value of processed inpatient claims
    model: qpp_demo
    explore: qppar__prod__latest__extract_inpatient_claims__inpatient_claims
    type: single_value
    fields:
    - qppar__prod__latest__extract_inpatient_claims__inpatient_claims.total_claims_amt
    listen: {}
    row: 16
    col: 12
    width: 12
    height: 8
  - name: Total value of processed claims
    label: Total value of processed claims
    model: qpp_demo
    explore: claims_totals
    type: single_value
    fields:
    - claims_totals.total_claims_amt
    listen: {}
    row: 24
    col: 0
    width: 12
    height: 8
  - name: Claims amt per npi
    label: Claims amt per npi
    model: qpp_demo
    explore: claims_per_npi
    type: table
    fields:
    - claims_per_npi.total_claims_amt
    - claims_per_npi.npi
    listen: {}
    row: 24
    col: 12
    width: 12
    height: 8
  - name: Claims Totals by Date
    label: Claims Totals by Date
    model: qpp_demo
    explore: total_claim_paid_amount_by_date
    type: looker_line
    fields:
    - total_claim_paid_amount_by_date.sumclaim_paid_amount
    - total_claim_paid_amount_by_date.end_date
    sorts:
    - total_claim_paid_amount_by_date.end_date desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    series_types: {}
    listen: {}
    row: 8
    col: 0
    width: 24
    height: 8
