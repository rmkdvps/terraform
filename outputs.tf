

output "jenkins_ip" {  
description = "IP of the Jenkins EC2 instance"  
value       = module.jenkins.jenkins_public_ip
}