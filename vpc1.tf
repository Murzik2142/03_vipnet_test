# create the VPC1
resource "aws_vpc" "VPC1" {
  cidr_block           = var.VPC1CIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
  tags = {
    Name = "VPC1"
  }
} 

# create Subnets
resource "aws_subnet" "Public_VPC1_Subnet" {
  vpc_id                  = aws_vpc.VPC1.id
  cidr_block              = var.VPC1publicsubnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
  tags = {
     Name = "Public VPC1 Subnet"
  }
}

resource "aws_subnet" "Private_VPC1_Subnet" {
  vpc_id                  = aws_vpc.VPC1.id
  cidr_block              = var.VPC1privatesubnetCIDRblock
  map_public_ip_on_launch = false 
  availability_zone       = var.availabilityZone
  tags = {
     Name = "Private VPC1 Subnet"
  }
}

# Create the Internet Gateway
resource "aws_internet_gateway" "VPC1_GW" {
 vpc_id = aws_vpc.VPC1.id
 tags = {
        Name = "VPC1 Internet Gateway"
 }
}

# Create the Route Table
resource "aws_route_table" "VPC1_route_table" {
 vpc_id = aws_vpc.VPC1.id
 tags = {
        Name = "VPC1 Route Table"
 }
}

# Create the Internet Access
resource "aws_route" "VPC1_internet_access" {
  route_table_id         = aws_route_table.VPC1_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.VPC1_GW.id
}

## Crete route to Coordinator
resource "aws_route" "VPC1_VPN_route" {
  route_table_id         = aws_route_table.VPC1_route_table.id
  destination_cidr_block = "11.0.0.0/8"
  instance_id             = "${aws_instance.vipnet_coordinator_VPC1.id}"
}

resource "aws_route_table_association" "VPC1_association" {
  subnet_id      = aws_subnet.Public_VPC1_Subnet.id
  route_table_id = aws_route_table.VPC1_route_table.id
}

resource "aws_route_table_association" "vpn_route_association_VPC1" {
  subnet_id      = aws_subnet.Private_VPC1_Subnet.id
  route_table_id = aws_route_table.VPC1_route_table.id
}