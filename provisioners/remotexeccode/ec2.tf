resource "aws_instance" "inst" {
  ami             = "ami-096fda3c22c1c990a"
  instance_type   = "t2.micro"
  key_name        = "terraform"
  security_groups = ["fullaccess"]


  provisioner "remote-exec" {
    #when = destroy
    on_failure = continue
    inline = [
      "sudo yum install ngix -y",
      #"sudo systemctl stop nginx",
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("./terraform.pem")
    }
  }
}
