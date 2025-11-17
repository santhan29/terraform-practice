resource "aws_security_group" "allow_ssh" { 
  name        = "allow_ssh" 
  description = "Allow ssh inbound traffic and all outbound traffic"
  
  # usually we allow everything in egress 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"  
    cidr_blocks      = ["0.0.0.0/0"]  
  }

  tags = {
    Name = "allow_tls"
  }
}   

resource "aws_instance" "ec2-terraform" {
  ami = "ami-09c813fb71547fc4f"  
  instance_type = "t3.micro" 
  vpc_security_group_ids = ["sg-07a395630b225807a"] # list means [] (box brackets) 

  tags = {
    Name = "ec2-terraform"  
  }

}

