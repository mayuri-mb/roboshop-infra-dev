resource "aws_ssm_parameter" "backend_alb_listener_arn" {
    name = "/${var.project}/${var.environment}/backend_alb_istener_arn"
    type = "String"
    value = aws_alb_listener.http.arn
}