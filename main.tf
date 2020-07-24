#
# SNS
#
data "aws_sns_topic" "main" {
  name = var.sns_topic_name
}

#
# CloudWatch Event
#
resource "aws_cloudwatch_metric_alarm" "alarm_cw_natgw_active_cx" {
  count = var.send_sns ? 1 : 0

  alarm_name          = var.alarm_suffix == "" ? "vpc-natgw-active-cx-count-alarm" : "vpc-natgw-active-cx-count-alarm-${var.alarm_suffix}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  datapoints_to_alarm = "1"
  metric_name         = "ActiveConnectionCount"
  namespace           = "AWS/NATGateway"
  period              = var.alarm_period
  statistic           = "Maximum"
  threshold           = "0"
  alarm_description   = "VPC Nat Gateway CW ActiveConnectionCount Rule has been triggered"
  alarm_actions       = [data.aws_sns_topic.main.arn]
}
