resource "aws_instance" "VPC2_private_instance2" {
  ami             = "${data.aws_ami.ubuntu.id}"
  subnet_id       = "${aws_subnet.Private_VPC2_Subnet2.id}"
  key_name        = "${aws_key_pair.key.id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.Tunnel_VPC2_SG.id}"]
  user_data = <<-EOF
		#! /bin/bash
    sudo apt-get update
		sudo apt-get install iperf3
	  EOF

  tags = {
    Name = "tunnel-22-MMM"
  }
}
/*
resource "aws_eip" "VPC2_private_instance2" {
  instance = "${aws_instance.VPC2_private_instance2.id}"
  vpc      = true
  tags = {
    Name = "VPC2_private_instance2"
  }
}
*/