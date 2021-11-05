output "jenkins_public_ip" {  
description = "IP of the EC2 instance"  
value       = aws_instance.jenkins_server.public_ip
}
