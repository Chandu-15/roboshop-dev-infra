module "catalogue_component" {
  source        = "git::https://github.com/Chandu-15/terraform-roboshop-aws-component.git?ref=main"
  component     = "catalogue"
  rule_priority = var.components["catalogue"].rule_priority
  environment=var.environment
}

module "user_component" {
  source        = "git::https://github.com/Chandu-15/terraform-roboshop-aws-component.git?ref=main"
  component     = "user"
  rule_priority = var.components["user"].rule_priority
  environment=var.environment
}

module "cart_component" {
  source        = "git::https://github.com/Chandu-15/terraform-roboshop-aws-component.git?ref=main"
  component     = "cart"
  rule_priority = var.components["cart"].rule_priority
  environment=var.environment
}

module "shipping_component" {
  source        = "git::https://github.com/Chandu-15/terraform-roboshop-aws-component.git?ref=main"
  component     = "shipping"
  rule_priority = var.components["shipping"].rule_priority
  environment=var.environment
}

module "payment_component" {
  source        = "git::https://github.com/Chandu-15/terraform-roboshop-aws-component.git?ref=main"
  component     = "payment"
  rule_priority = var.components["payment"].rule_priority
  environment=var.environment
}

module "frontend_component" {
  source        = "git::https://github.com/Chandu-15/terraform-roboshop-aws-component.git?ref=main"
  component     = "frontend"
  rule_priority = var.components["frontend"].rule_priority
  environment=var.environment
}
