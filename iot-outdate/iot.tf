resource "aws_iot_topic_rule" "iot_duress_beacon_topic_rule" {
  name        = var.iot_topic_rule_name
  description = "Trigger the beacon-battery Lambda function with an event version 1"
  enabled     = true
  sql         = "SELECT * FROM 'beacon/battery'"
  sql_version = "2016-03-23"

  lambda {
    function_arn = aws_lambda_function.duress_beacon_function.arn
  }
}
