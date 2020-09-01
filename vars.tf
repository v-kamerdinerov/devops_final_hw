variable "region" {
 default = "us-east-2"
}

variable "image_id" {
  default = "ami-0bbe28eb2173f6167"
}

variable "instance_type" {
 default = "t2.micro"
}

variable "security_group" {
  default = ["sg-09ce11f213f8c6b3c"]
}

variable "subnet_id" {
  default = "subnet-4a8eb730"
}

#resource "aws_key_pair" "amazon" {
#  key_name = "amazon"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCcmFwu15kFVZ2RKQbzZzu/g5je1SJ57iN9CdTgm/321skFrqCMtBF/ybae8aemjRLaZemLK8QmfBc3dg9EU9CAjJXO1QZbL0r7wpHR9/Ot/q5kcppqaa8vJuuQaioNxw+8j84gialaVNT/d8Cpm1b0IbE9e6UKjcTUdnBKKIYij8mFQX1NUadxizsYGo6YZQYY8+hTAH8URKQ7u6U4C9m9hX9seOo29BFMeMffX0hUV4S3NmKY85KJuK2xseVzv93gEh+oz93y5dREupAiLjXvteCLY/i6qCpcKl4lvquA3yZWCp0Y6pxv6lZhrF8m17FTzsU8UiXyPmz4s0jmNRnJ root@ip-172-31-23-231"
#}

variable "key_name" {
  default = "amazon"
}
