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
  default = ["sg-02919053736cfa206"]
}

variable "subnet_id" {
  default = "subnet-eb74a180"
}

variable "key_name" {
  default = "amazon"
}
