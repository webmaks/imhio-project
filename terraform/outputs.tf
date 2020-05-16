output "appip" {
  value = "${aws_instance.app.public_ip}"
}

output "dbip" {
  value = "${aws_instance.db.public_ip}"
}

# output "nat.ip" {
#   value = "${aws_instance.nat.public_ip}"
# }
