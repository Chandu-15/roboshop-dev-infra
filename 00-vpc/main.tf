module "vpc"{
    source="git::https://github.com/Chandu-15/terraform-vpc-aws.git?ref=main"
    cidr_block=var.cidr
    project_name=var.project_name
    environment=var.environment
    public_subnet_cidrs=var.public_subnet_cidr_block
    private_subnet_cidrs=var.private_subnet_cidr_block
    database_subnet_cidrs=var.database_subnet_cidr_block
}