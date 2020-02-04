resource "aws_instance" "vipnet_coordinator_VPC1" {
	ami = "${var.vipami}"
	instance_type = "${var.vipcoordinator_type1}"
  	subnet_id = "${aws_subnet.Public_VPC1_Subnet.id}"
	user_data = "${file("${var.VPC1_init}")}"
	source_dest_check = false
	security_groups = ["${aws_security_group.Vipnet_VPC1_SG.id}"]
	tags = {
		Name = "VCCR1-MMM"
	}
}