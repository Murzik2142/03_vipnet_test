resource "aws_instance" "VPC2_private_instance3" {
  ami             = "${data.aws_ami.ubuntu.id}"
  subnet_id       = "${aws_subnet.Private_VPC2_Subnet3.id}"
  key_name        = "${aws_key_pair.key.id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.Tunnel_VPC2_SG.id}"]
  user_data = <<-EOF
		#! /bin/bash
    sudo apt-get update
		sudo apt-get install -y apache2 iperf3
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	  EOF

  tags = {
    Name = "tunnel-23-МММ"
  }
}
resource "aws_eip" "VPC2_private_instance3" {
  instance = "${aws_instance.VPC2_private_instance3.id}"
  vpc      = true
  tags = {
    Name = "VPC2_private_instance3"
  }
}