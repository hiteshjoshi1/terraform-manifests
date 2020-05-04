provider "aws" {
  profile    = "default"
  region     = "ap-southeast-1"
}
resource "aws_key_pair" "example" {
  key_name   = "examplekey"
  public_key = file("~/.ssh/tf.pub")
}
resource "aws_instance" "example" {
  key_name      = aws_key_pair.example.key_name
  ami           = "ami-0dff4318d85149d5d"
  instance_type = "t2.micro"
  

connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/tf")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo service nginx start"
    ]
  }
}
