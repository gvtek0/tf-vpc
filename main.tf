resource "aws_vpc" "Main" {
    cidr_block = var.main_vpc_cidr
    instance_tenancy = "default"
}
