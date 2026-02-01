resource "aws_ssm_parameter" "frontend_alb_listener"{
    name="/${var.project_name}/${var.environment}/frontend_alb_listener"
    type="String"
    value=aws_lb_listener.frontend_alb.arn
    overwrite = true
}