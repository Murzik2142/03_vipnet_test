/*
variable "key_name" {
    default ="MurzabaevMM"
}
*/
resource "aws_key_pair" "key" {
  key_name   = "MurzabaevMM"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFBKZbZJKq7V8bU2v9SnYlK9Wp+08jA5iI20H0XQC/sH/K318zTFcJ5sTFUmU8owmCYCYKN2pbVov72fMNQe/p42i/bU/YupinbRxax9ykxDa9Wec2a5GMCB6rwT6pHb235+0H5qGgWsR07NoMWu2O6BAWh/HPiF6NU1vcXkkDlHKrUuASb2xY7TOqD/Filb/u+oK9bAapj3ws2q4yXmmFKHkSwIH556LhaT04s530H9Ij1kQyGMeROEbh/BjIn6edpU5NBsF9zTYWYNcYPaB5066bcXEQej+RjrewJoU+vreeT9wAwIiHRpop8n7H2BZcQ2/K7vIE45jh7+Kh79mP MurzabaevMM-Amazon"
}

variable "region" {
     default = "eu-central-1"
}
variable "availabilityZone" {
     default = "eu-central-1a"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}

### VPC1 IP addresses
variable "VPC1CIDRblock" {
    default = "10.0.0.0/24"
}
variable "VPC1publicsubnetCIDRblock" {
    default = "10.0.0.0/25"
}
variable "VPC1privatesubnetCIDRblock" {
    default = "10.0.0.128/25"
}

### VPC2 IP addresses
variable "VPC2CIDRblock" {
    default = "10.0.1.0/24"
}
variable "VPC2publicsubnetCIDRblock" {
    default = "10.0.1.0/26"
}
variable "VPC2privatesubnet1CIDRblock" {
    default = "10.0.1.64/26"
}
variable "VPC2privatesubnet2CIDRblock" {
    default = "10.0.1.128/26"
}
variable "VPC2privatesubnet3CIDRblock" {
    default = "10.0.1.192/26"
}
### ACL
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}

### Vipnet Coordinator
variable "vipami" {
    default = "ami-045a64d0d066d5624"
}
variable "vipcoordinator_type1" {
    default = "t3.micro"
}
variable "vipcoordinator_type2" {
    default = "t3.micro"
}
#Warning WINDOWS
variable "winami" {
    default = "ami-0cbf1b1038bbb408d"
}

variable "VPC1_init" {
    default = "/home/ec2-user/Terraform/keys/03/VCCR1/remote_init"
}
variable "VPC2_init" {
    default = "/home/ec2-user/Terraform/keys/03/VCCR2/remote_init"
}

