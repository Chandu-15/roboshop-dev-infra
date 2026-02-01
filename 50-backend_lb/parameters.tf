resource "aws_ssm_parameter" "backend_alb_listener"{
    name="/${var.project_name}/${var.environment}/backend_alb_listener"
    type="String"
    value=aws_lb_listener.backend_alb.arn
    overwrite = true
}