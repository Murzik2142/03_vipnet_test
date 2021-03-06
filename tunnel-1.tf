resource "aws_instance" "VPC1_private_instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  subnet_id       = "${aws_subnet.Private_VPC1_Subnet.id}"
  key_name        = "${aws_key_pair.key.id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.Tunnel_VPC1_SG.id}"]
  user_data = <<-EOF
		#! /bin/bash
    sudo apt-get update
		sudo apt-get install iperf3
	  EOF

  tags = {
    Name = "tunnel-1-MMM"
  }
}
 /*
resource "aws_eip" "VPC1_private_instance" {
  instance = "${aws_instance.VPC1_private_instance.id}"
  vpc      = true
  tags = {
    Name = "VPC1_private_Tunnel1"
  }
}
*/