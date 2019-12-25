# create the VPC2
resource "aws_vpc" "VPC2" {
  cidr_block           = var.VPC2CIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
  tags = {
    Name = "VPC2"
  }
} 

# create Subnets
resource "aws_subnet" "Public_VPC2_Subnet" {
  vpc_id                  = aws_vpc.VPC2.id
  cidr_block              = var.VPC2publicsubnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
tags = {
   Name = "Public VPC2 Subnet"
}
}

resource "aws_subnet" "Private_VPC2_Subnet1" {
  vpc_id                  = aws_vpc.VPC2.id
  cidr_block              = var.VPC2privatesubnet1CIDRblock
  map_public_ip_on_launch = false 
  availability_zone       = var.availabilityZone
tags = {
   Name = "Private VPC2 Subnet1"
}
}
resource "aws_subnet" "Private_VPC2_Subnet2" {
  vpc_id                  = aws_vpc.VPC2.id
  cidr_block              = var.VPC2privatesubnet2CIDRblock
  map_public_ip_on_launch = false 
  availability_zone       = var.availabilityZone
tags = {
   Name = "Private VPC2 Subnet2"
}
}
resource "aws_subnet" "Private_VPC2_Subnet3" {
  vpc_id                  = aws_vpc.VPC2.id
  cidr_block              = var.VPC2privatesubnet3CIDRblock
  map_public_ip_on_launch = false 
  availability_zone       = var.availabilityZone
tags = {
   Name = "Private VPC2 Subnet3"
}
}
# Create the Internet Gateway
resource "aws_internet_gateway" "VPC2_GW" {
 vpc_id = aws_vpc.VPC2.id
 tags = {
        Name = "VPC2 Internet Gateway"
 }
}

# Create the Route Table
resource "aws_route_table" "VPC2_route_table" {
 vpc_id = aws_vpc.VPC2.id
 tags = {
        Name = "VPC2 Route Table"
 }
}
## Crete route to Coordinator
resource "aws_route" "VPC2_VPN_route" {
  route_table_id         = aws_route_table.VPC2_route_table.id
  destination_cidr_block = "11.0.0.0/8"
  instance_id             = aws_instance.vipnet_coordinator_VPC2.id
}

# Create the Internet Access
resource "aws_route" "VPC2_internet_access" {
  route_table_id         = aws_route_table.VPC2_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.VPC2_GW.id
}

resource "aws_route_table_association" "VPC2_association" {
  subnet_id      = aws_subnet.Public_VPC2_Subnet.id
  route_table_id = aws_route_table.VPC2_route_table.id
}
resource "aws_route_table_association" "vpn_route_association_VPC2-1" {
  subnet_id      = aws_subnet.Private_VPC2_Subnet1.id
  route_table_id = aws_route_table.VPC2_route_table.id
}
resource "aws_route_table_association" "vpn_route_association_VPC2-2" {
  subnet_id      = aws_subnet.Private_VPC2_Subnet2.id
  route_table_id = aws_route_table.VPC2_route_table.id
}
resource "aws_route_table_association" "vpn_route_association_VPC2-3" {
  subnet_id      = aws_subnet.Private_VPC2_Subnet3.id
  route_table_id = aws_route_table.VPC2_route_table.id
}