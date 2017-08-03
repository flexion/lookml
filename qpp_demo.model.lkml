connection: "spark-sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: qppar__prod__latest__extract_beneficiaries__beneficiaries {}

explore: qppar__prod__latest__extract_beneficiaries__dropped_records {}

explore: qppar__prod__latest__extract_carrier_claims__carrier_claims {}

explore: qppar__prod__latest__extract_carrier_claims__dropped_records {}

explore: qppar__prod__latest__extract_inpatient_claims__dropped_records {}

explore: qppar__prod__latest__extract_inpatient_claims__inpatient_claims {}

explore: qppar__prod__latest__extract_outpatient_claims__dropped_records {}

explore: qppar__prod__latest__extract_outpatient_claims__outpatient_claims {}

explore: qppar__prod__latest__submissions_transformed__submissions {
#  join: percent_npis_submitted {
#    view_label: "percent_npis_submitted"
#    fields: [qppar__prod__latest__submissions_transformed__submissions.total_npis,
#      qppar__prod__latest__extract_outpatient_claims__outpatient_claims.total_npis]
#    type: full_outer
#    relationship: many_to_many
#    sql_on: ${qppar__prod__latest__submissions_transformed__submissions.nationalprovideridentifier} =
#    ${qppar__prod__latest__extract_outpatient_claims__outpatient_claims.at_physn_npi};;
#  }
}

explore: qppar__prod__latest__transform_beneficiaries__beneficiaries_clean {}

explore: qppar__prod__latest__transform_carrier_claims__carrier_claims_clean {}

explore: qppar__prod__latest__transform_inpatient_claims__inpatient_claims_clean {}

explore: qppar__prod__latest__transform_outpatient_claims__outpatient_claims_clean {}

explore: claims_per_npi {}

explore: claims_totals {}
