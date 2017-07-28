view: qppar__prod__latest__mspb__mspb_output {
  sql_table_name: default.qppar__prod__latest__mspb__mspb_output ;;
  suggestions: no

  dimension: averageriskadjustedmspb {
    type: number
    sql: ${TABLE}.averageriskadjustedmspb ;;
  }

  dimension: episodecount {
    type: number
    sql: ${TABLE}.episodecount ;;
  }

  dimension: tin {
    type: string
    sql: ${TABLE}.tin ;;
  }

  dimension: totalexpectedcost {
    type: number
    sql: ${TABLE}.totalexpectedcost ;;
  }

  dimension: totalstandardizedcost {
    type: number
    sql: ${TABLE}.totalstandardizedcost ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
