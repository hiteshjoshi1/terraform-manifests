provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "achieveraws"
}
