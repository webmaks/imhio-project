data "aws_ami" "centos-db" {
  owners      = ["679593333241"]
  most_recent = true
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "db" {
#  count           = 1
  vpc_security_group_ids = [aws_security_group.db_security.id]
  ami             = "${data.aws_ami.centos-db.id}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.mytest-key.id}"

  tags = {
    Name = "DB MySQL Server"
  }
}