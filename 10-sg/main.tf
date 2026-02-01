module "sg"{
    count=length(var.sg_names)
    source="git::https://github.com/Chandu-15/terraform-sg-aws.git?ref=main"
    sg_name=var.sg_names[count.index]
    project_name=var.project_name
    environment=var.environment
    vpc_id=local.vpc_id
}