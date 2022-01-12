# The name of this view in Looker is "Events New"
view: events_new_new {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `nimbus.events_new_new`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    label:"כתובת"
    sql: ${TABLE}.address;;
  }

  dimension: case {
    label:"אירוע"
    type: number
    sql: ${TABLE}.`case` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_case {
    type: sum
    label:"מספר אירוע"
    sql: ${case} ;;
  }

  measure: average_case {
    type: average
    sql: ${case} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    label:"תאריך אירוע"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.location_lat;;
    sql_longitude:${TABLE}.location_lon;;
  }


  dimension: severity {
    type: number
    label:"חומרה"
    sql: ${TABLE}.severity ;;
  }

  dimension: type {
    type: string
    label:"סוג אירוע"
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
