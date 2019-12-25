resource "aws_instance" "VPC1_private_instance_win1" {
  ami               = "${var.winami}"
  subnet_id       = "${aws_subnet.Private_VPC1_Subnet.id}"
  #key_name        = "MurzabaevMM"
  instance_type   = "t2.micro"
  tags = {
    Name = "Client-1-МММ"
    
  }
}