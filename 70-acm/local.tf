locals{
    common_tags={
        project_name=var.project_name
        terraform=true
        environment=var.environment
    }
    common_name="${var.project_name}.${var.environment}"
    
}