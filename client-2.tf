resource "aws_instance" "VPC2_private_instance-win2" {
  ami               = "${var.winami}"
  subnet_id       = "${aws_subnet.Private_VPC2_Subnet1.id}"
  key_name        = "${aws_key_pair.key.id}"
  security_groups = ["${aws_security_group.Tunnel_VPC2_SG.id}"]
  instance_type   = "t2.micro"

  tags = {
    Name = "Client-2-MMM"
  }
}