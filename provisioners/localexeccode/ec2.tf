resource "aws_instance" "inst" {
  ami           = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"


  provisioner "local-exec" {
    command = "echo ${aws_instance.inst.private_ip} >> private_ips.txt"
  }
}
