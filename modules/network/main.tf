resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.main.id
  
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_security_group" "allow_jenkins" {
  name        = "allow_jenkins"
  description = "Allow jenkins inbound traffic"
  vpc_id      = aws_vpc.main.id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_jenkins"
  }
}