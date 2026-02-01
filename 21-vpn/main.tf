resource "aws_instance" "main"{
    ami=local.ami_id
    instance_type=var.instance_type
    vpc_security_group_ids=[local.openvpn_sg_id]
    subnet_id=local.public_subnet_id
    user_data=file("openvpn.sh")  
    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-openvpn"
        }
    )        
}

