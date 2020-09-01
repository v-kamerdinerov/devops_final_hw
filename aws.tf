provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "build_instance" {
  ami = "${var.image_id}"
  instance_type = "t2.micro"
#  key_name = "${aws_key_pair.amazon.key_name}"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = "${var.security_group}"
  subnet_id = "${var.subnet_id}"
  user_data = file("config.sh")
   tags = {
    Name = "build"
  }
}


resource "aws_instance" "prod_instance" {
  ami = "${var.image_id}"
  instance_type = "t2.micro"
#  key_name = "${aws_key_pair.amazon.key_name}"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = "${var.security_group}"
  subnet_id = "${var.subnet_id}"
  user_data = file("config.sh")
  tags = {
    Name = "prod"
  }
}