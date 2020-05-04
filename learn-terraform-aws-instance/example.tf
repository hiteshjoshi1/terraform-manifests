provider "aws" {
  profile    = "default"
  region     = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0dff4318d85149d5d"
  instance_type = "t2.micro"
  key_name      = "achieveraws"
}
