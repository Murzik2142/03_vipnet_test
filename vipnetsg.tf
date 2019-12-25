# Create the Security Group
resource "aws_security_group" "Vipnet_VPC1_SG" {
  vpc_id       = aws_vpc.VPC1.id
  name         = "Vipnet_SG"
  description  = "Vipnet SG"
  
  # allow ingress of port UDP 55777
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 55000
    to_port     = 55777
    protocol    = "udp"
  } 

  # allow ingress of port TCP tunnel 443
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  } 
    # allow ingress of port TCP tunnel 80
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
      # allow ingress of port TCP tunnel 22
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }  
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
  } 
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "Vipnet VPC1 SG"
   Description = "Vipnet VPC1 SG"
  }
}
# Create the Security Group
resource "aws_security_group" "Vipnet_VPC2_SG" {
  vpc_id       = aws_vpc.VPC2.id
  name         = "Vipnet_SG"
  description  = "Vipnet SG"
  
  # allow ingress of port UDP 55777
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 55000
    to_port     = 55777
    protocol    = "udp"
  } 

  # allow ingress of port TCP tunnel 443
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  } 
      # allow ingress of port TCP tunnel 80
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  } 
      # allow ingress of port TCP tunnel 22
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }  
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
  } 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "Vipnet VPC2 SG"
   Description = "Vipnet VPC2 SG"
  }
} 