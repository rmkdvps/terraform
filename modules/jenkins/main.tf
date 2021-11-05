
resource "aws_instance" "jenkins_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.vpc_security_group}"]
  
  tags = {
    "Name" = "${var.env}-jenkins_server"
 }
}