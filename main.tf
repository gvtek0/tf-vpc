resource "aws_vpc" "Main" {
    cidr_block = var.main_vpc_cidr
    instance_tenancy = "default"
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Main.id
}

resource "aws_subnet" "publicsubnets" {
  vpc_id = aw_vpc.Main.id
  cidr_block = "${var.public_subnets}"
}

resource "aws_subnet" "privatesubnets" {
  vpc_id = aws_vpc.Main.id
  cidr_block = "${var.private_subnets}"
}