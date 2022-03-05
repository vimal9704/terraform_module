provider "aws" {
    region = "us-east-1" 
}
module "my_vpc" {
    source      = "../modules/vpc"
    vpc_cidr    = "192.168.0.0/16"
    vpc_id      = "${module.my_vpc.vpc_id}"
    subnet_cidr = "192.168.1.0/24" 
}
module "my_ec2" {
    source          = "../modules/ec2"
    ami_id          = "ami-0c293f3f676ec4f90"
    instance_type   = "t2.micro"
    subnet_id       = "${module.my_vpc.subnet_id}"
  
}