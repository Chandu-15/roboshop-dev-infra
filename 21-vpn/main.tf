resource "aws_instance" "main"{
    ami=local.ami_id
    instance_type=var.instance_type
    vpc_security_group_ids=[local.open_vpn_sg_id]
    subnet_id=local.public_subnet_id
    user_data=file("openvpn.sh")  
    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-openvpn"
        }
    )        
}

resource "aws_route53_record" "openvpn" {
  zone_id = var.zone_id
  name    = "openvpn.${var.domain_name}" # openvpn.daws86s.fun
  type    = "A"
  ttl     = 1
  records = [aws_instance.main.public_ip]
  allow_overwrite = true
}

