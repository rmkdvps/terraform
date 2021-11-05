output "subnet_id" {  
description = "IP of the EC2 instance"  
value       = aws_subnet.main.id
}

output "vpc_sec_gr" {  
description = "Security group id for vpc"  
value       = aws_security_group.allow_jenkins.id
}
