resource "aws_instance" "ec2-terraform" {
  ami = var.ami_id
  instance_type = var.environment == "production" ? "t3.medium" : "t3.micro" 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]   # list means [] (box brackets) 

  tags = var.ec2_tags

}  

resource "aws_security_group" "allow_ssh" { 
  name        = var.sg_name
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

  tags = var.sg_tags
}   
