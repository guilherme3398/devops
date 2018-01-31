        #identificao do proprio recurso
resource "aws_security_group" "allow-ssh"{ #nome do recurso
  vpc_id = "${data.aws_vpc.vpc.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  tags {
    Name = "allow-ssh"
  }
}