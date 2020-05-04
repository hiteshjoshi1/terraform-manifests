# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "hitesh-terraform-playground"
  acl    = "private"
}


provider "aws" {
  profile    = "default"
  region     = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0dff4318d85149d5d"
  instance_type = "t2.micro"
  key_name      = "achieveraws"
  depends_on    = [aws_s3_bucket.example]
}
