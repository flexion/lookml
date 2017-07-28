view: qppar__prod__latest__mspb__episodes_output {
  sql_table_name: default.qppar__prod__latest__mspb__episodes_output ;;
  suggestions: no

  dimension: agegroupatepisode {
    type: string
    sql: ${TABLE}.agegroupatepisode ;;
  }

  dimension: beneficiary {
    type: string
    sql: ${TABLE}.beneficiary ;;
  }

  dimension: beneficiaryid {
    type: string
    sql: ${TABLE}.beneficiaryid ;;
  }

  dimension: carrierclaims {
    type: string
    sql: ${TABLE}.carrierclaims ;;
  }

  dimension: episodeid {
    type: string
    sql: ${TABLE}.episodeid ;;
  }

  dimension: indexclaim {
    type: string
    sql: ${TABLE}.indexclaim ;;
  }

  dimension: inpatientclaims {
    type: string
    sql: ${TABLE}.inpatientclaims ;;
  }

  dimension: mdc {
    type: string
    sql: ${TABLE}.mdc ;;
  }

  dimension: nationalprovideridentifier {
    type: string
    sql: ${TABLE}.nationalprovideridentifier ;;
  }

  dimension: outpatientclaims {
    type: string
    sql: ${TABLE}.outpatientclaims ;;
  }

  dimension: taxidentificationnumber {
    type: string
    sql: ${TABLE}.taxidentificationnumber ;;
  }

  dimension: totalcost {
    type: number
    sql: ${TABLE}.totalcost ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
