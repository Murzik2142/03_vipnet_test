# Create the Security Group
resource "aws_security_group" "Tunnel_VPC1_SG" {
  vpc_id       = aws_vpc.VPC1.id
  name         = "Tunnel_SG"
  description  = "Tunnel SG"
  
    # allow ingress of all ports
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  } 
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "Tunnel VPC1 SG"
   Description = "Tunnel VPC1 SG"
  }
}
# Create the Security Group
resource "aws_security_group" "Tunnel_VPC2_SG" {
  vpc_id       = aws_vpc.VPC2.id
  name         = "Tunnel_SG"
  description  = "Tunnel SG"
  
    # allow ingress of all ports
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  } 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "Tunnel VPC2 SG"
   Description = "Tunnel VPC2 SG"
  }
} 