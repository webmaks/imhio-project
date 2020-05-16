# export AWS_ACCESS_KEY_ID="AKIARGBYTXIRQWWWLA7S"
# export AWS_SECRET_ACCESS_KEY="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"
# export AWS_DEFAULT_REGION="eu-central-1"
provider "aws" {
  access_key = "AKIARGBYTXIRQWWWLA7S"
  secret_key = "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"
  region     = "eu-central-1"

}


data "aws_ami" "centos-app" {
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

resource "aws_instance" "app" {
#  count           = 1
  vpc_security_group_ids = [aws_security_group.app_security.id]
  ami             = "${data.aws_ami.centos-app.id}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.mytest-key.id}"

  tags = {
    Name = "App Server"
  }
}
