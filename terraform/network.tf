resource "aws_vpc" "vpc_main" {
    cidr_block = ""
    enable_dns_hostnames = true
    enable_dns_support = true
    enable_network_address_usage_metrics = true
    region = var.def_region
}

resource "aws_subnet" "pub_sub_01" {
    vpc_id = aws_vpc.vpc_main.id
    availability_zone = "ap-south-1a"
    cidr_block = ""
    map_public_ip_on_launch = true
}

resource "aws_subnet" "pub_sub_02" {
    vpc_id = aws_vpc.vpc_main.id
    availability_zone = "ap-south-1b"
    cidr_block = ""
    map_public_ip_on_launch = true
}

resource "aws_subnet" "pri_sub_01" {
    vpc_id = aws_vpc.vpc_main.id
    availability_zone = "ap-south-1a"
    cidr_block = ""
}

resource "aws_subnet" "pri_sub_02" {
    vpc_id = aws_vpc.vpc_main.id
    availability_zone = "ap-south-1b"
    cidr_block = ""
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_main.id
}
resource "aws_route_table" "route" {
    vpc_id = aws_vpc.vpc_main.id
}

resource "aws_route_table_association" "route_ass" {
    route_table_id = aws_route_table.route.id
    gateway_id = aws_internet_gateway.igw.id
    subnet_id = ""
}
