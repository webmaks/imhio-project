resource "aws_security_group" "db_security" {
  name        = "DB security"
  description = "Security group for DB"

  ########################
  # AWS ALLOW ALL EGRESS #
  ########################

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

   ingress { # MySQL
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

#    security_groups = ["${aws_security_group.app_security.id}"]
  }

  #vpc_id = "${aws_vpc.default.id}"

  tags = {
    Name = "My Application"
  }
}
