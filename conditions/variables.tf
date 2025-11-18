variable "sg_name" {
    type = string
    description = "this is the name of the security group"
    default = "allow_ssh"
}

variable "ami_id" {
    type = string
    description = "this is ami id used by the ec2-instance"
    default = "ami-09c813fb71547fc4f" 
}

variable "type_instance" {
    type = string 
    description = "type of the ec2-instance"
    default = "t3.micro" 
}


variable "sg_tags" { 
    description = "tags for the security group"
    default = {
        Name = "allow_tls"
        Project = "expense" 
        Terraform = "true" 
    }
}

variable "ec2_tags" { 
    description = "tags for the ec2-instance" 
    default = {
        Name = "ec2-terraform"  
        Project = "expense" 
        Terraform = "true" 
    }
}

variable "environment" {
    description = "defines in which environment we are going to create the resource" 
    type = string
    default = "production" 
}