resource "aws_security_group" "app_security" {
  name        = "App security"
  description = "Security group for app"

  ########################
  # AWS ALLOW ALL EGRESS #
  ########################

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # egress { # MySQL
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = ["${var.vpc_cidr}"]
  # }

  ##################
  # STANDARD PORTS #
  ##################

  # SSH access (should theoretically be a whitelist, not potentially open to any IP...)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 8084
    to_port     = 8084
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # vpc_id = "${aws_vpc.default.id}"

  tags = {
    Name = "My Application"
  }
}
