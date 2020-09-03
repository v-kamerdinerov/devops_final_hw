provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "build_instance" {
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = "${var.security_group}"
  subnet_id = "${var.subnet_id}"
  user_data = file("config.sh")
   tags = {
    Name = "build"
  }
  provisioner "local-exec" {
    command = "sleep 80; sed -i \"/build/a ${aws_instance.build_instance.public_ip}\" hosts"
  }
}
#try 120-200 or less


resource "aws_instance" "prod_instance" {
  ami = "${var.image_id}"
  instance_type = "t2.micro"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = "${var.security_group}"
  subnet_id = "${var.subnet_id}"
  user_data = file("config.sh")
  tags = {
    Name = "prod"
  }
  provisioner "local-exec" {
    command = "sleep 80; sed -i \"/prod/a ${aws_instance.prod_instance.public_ip}\" hosts"
  }
}

