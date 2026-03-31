resource "aws_instance" "docker_instance" {
  ami           = "ami-05d2d839d4f73aafb" 
  instance_type = "t3.micro"
  key_name      = "ec-2key"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              docker pull nginx
              docker run -d -p 80:80 nginx
              EOF
 

  tags = {
    Name = "Docker-Instance"
  }
}

 