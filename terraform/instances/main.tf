terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_subnet" "selected" {
  id = "${var.subnet_id}"
}

resource "aws_security_group" "webserver" {
  name        = "webserver-sg-${var.rm}"
  description = "Allow traffic for 80, 443 and internal to 22"
  vpc_id = "${var.vpc_id}"

  tags = {
    project       = "${var.project}"
    turma         = "${var.turma}"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
  ami                         = "${var.ami}"
  instance_type               = "t2.small"
  user_data                   = "${file("templates/${var.template}.yaml")}"
  associate_public_ip_address = true
  subnet_id		                = "${var.subnet_id}"
  vpc_security_group_ids      = ["${aws_security_group.webserver.id}"]

  tags = {
    turma         = "${var.turma}"
    rm            = "${var.rm}"
  }
}

resource "aws_eip" "eip-webserver" {
  instance = "${aws_instance.webserver.id}"
  vpc      = true

  tags = {
    turma         = "${var.turma}"
    rm            = "${var.rm}"
    }   
}

resource "aws_route53_record" "record-webserver" {
  zone_id = "${var.zone_id}"
  name    = "${var.rm}.${var.project}"
  type    = "A" 
  ttl     = "60"
  records = ["${aws_eip.eip-webserver.public_ip}"]
}
