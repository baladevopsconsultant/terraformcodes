resource "aws_security_group" "secure" {
  name = "baladevops"

  /*ingress{
		from_port = 440
		to_port = 440
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress{
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	} */

  dynamic "ingress" { #####important note: the block name of dynamic should match the type of the resource#####
    for_each = var.portmap
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
