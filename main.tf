# Create VPC
resource "aws_vpc" "Main" {
    cidr_block = var.main_vpc_cidr
    instance_tenancy = "default"
}

# Create IGW
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Main.id
}

# Create public
resource "aws_subnet" "publicsubnets" {
  vpc_id = aw_vpc.Main.id
  cidr_block = "${var.public_subnets}"
}

# Create private
resource "aws_subnet" "privatesubnets" {
  vpc_id = aws_vpc.Main.id
  cidr_block = "${var.private_subnets}"
}

# Route table for public
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.Main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id aws_internet_gateway.IGW.id
    }
}