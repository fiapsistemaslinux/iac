terraform {
  backend "s3" {
    bucket = "terraform.fiap.site"
    key    = "aws/infra"
    region = "us-east-1"
  }
}

resource "aws_vpc" "vpc_mediawiki" {
  cidr_block = "${var.cidr}"

  tags = {
    project       = "${var.project}"
    turma         = "${var.turma}"
  }
} 

resource "aws_subnet" "subnet_mediawiki" {
  vpc_id                    = "${aws_vpc.vpc_mediawiki.id}"
  map_public_ip_on_launch   = true
  cidr_block                = "${var.cidr}"
  availability_zone         = "us-east-1a"


  tags = {
    project       = "${var.project}"
    turma         = "${var.turma}"
  }
}

resource "aws_internet_gateway" "igw_mediawiki" {
  vpc_id    = "${aws_vpc.vpc_mediawiki.id}"

  tags = {
    project       = "${var.project}"
    turma         = "${var.turma}"
  }
}

resource "aws_default_route_table" "route_mediawiki" {
  default_route_table_id = "${aws_vpc.vpc_mediawiki.default_route_table_id}"

  tags = {
    project       = "${var.project}"
    turma         = "${var.turma}"
    }

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_mediawiki.id}"
  }
}

