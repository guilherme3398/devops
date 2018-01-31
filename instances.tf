provider "aws" {
    region = "${var.aws_region}"
}
          #comando      #nome da instancia
resource "aws_instance" "nginx-server"{
    ami             = "${var.aws_ami}"
    key_name        = "${var.aws_keypair}"
    instance_type   = "${var.aws_instancetype}"
    security_groups = ["${aws_security_group.allow-ssh.id}"]
    subnet_id       = "${data.aws_subnet.subnet_public.id}"
    #user_data       = "${file("scripts/nginx.sh")}"

#subir arquivos
    provisioner "file" {
        source          = "scripts/website.zip"
        destination     = "/home/ubuntu/website.zip" 
    
        connection {
            type = "ssh" 
            user = "ubuntu"
           private_key = "${file("${var.key-path}")}"
        }
    }
    
    provisioner "remote-exec" {
        script = "${file("scripts/nginx.sh")}"
        
        connection {
            type        = "ssh"
            user        = "ubuntu"
            private_key = "${file("${var.key-path}")}"
        }
    } 

    tags{
        Name = "nginx_server"

    }
}