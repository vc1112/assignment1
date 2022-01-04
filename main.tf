resource "aws_vpc"  "main" {
cidr_block = var.vpc_cidr
tags = {
Name = "myvpx"
	}
}

resource "aws_internet_gateway" "gw" {
vpc_id = aws_vpc.main.id
tags = {
name = "myigw"
}
}

resource "aws_subnet" "main" {
vpc_id = aws_vpc.main.id
cidr_block = var.subnets_cidr
availability_zone = var.azs
#map_public.ip_on_launch = true
tags = {
name = "subnet"
}
}
