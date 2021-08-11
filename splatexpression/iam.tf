resource "aws_iam_user" "balafamily" {
  name  = var.balafam[count.index]
  count = 4
}


output "balam" {
  #value = "${aws_iam_user.balafamily[*].arn}"
  value = aws_iam_user.balafamily[*].name
}
