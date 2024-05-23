resource "aws_cloudwatch_dashboard" "monitoring_dashboard" {
  name = "multi-tier-monitoring-dashboard"
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 24,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/EC2", "CPUUtilization", "InstanceId", "REPLACE_WITH_INSTANCE_ID", {"period": 300, "stat": "Average"}]
        ],
        "period": 300,
        "title": "EC2 CPU Utilization",
        "view": "timeSeries"
      }
    }
  ]
}
EOF
}
