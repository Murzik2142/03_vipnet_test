resource "aws_instance" "vipnet_coordinator_VPC2" {
	ami = "${var.vipami}"
	instance_type = "${var.vipcoordinator_type2}"
  	subnet_id = "${aws_subnet.Public_VPC2_Subnet.id}"
	user_data = "${file("${var.VPC2_init}")}"
	source_dest_check = false
	security_groups = ["${aws_security_group.Vipnet_VPC2_SG.id}"]
	tags = {
		Name = "VCCR2-MMM"
	}
}


resource "aws_eip" "VCCR2" {
  instance = "${aws_instance.vipnet_coordinator_VPC2.id}"
  vpc      = true
  tags = {
    Name = "VCCR2-MMM"
  }
}
