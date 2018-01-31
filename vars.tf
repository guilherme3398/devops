variable "aws_region" {
    default= "us-east-1"
}

variable "aws_ami"{
    default="ami-41e0b93b"
}

variable "aws_keypair"{
    default="devops-key" 
}

variable "aws_instancetype"{
    default ="t2.micro"
}

variable "key-path" {
    default = "~/.ssh/devops-key.pem"
}


data "aws_vpc" "vpc"{
}


data "aws_subnet_ids" "all-subnets"{
    vpc_id = "${data.aws_vpc.vpc.id}"

}

data "aws_subnet" "subnet_public" {
  count = "${length(data.aws_subnet_ids.all-subnets.ids)}"
  id = "${data.aws_subnet_ids.all-subnets.ids[count.index]}"
}