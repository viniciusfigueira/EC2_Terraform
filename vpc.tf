# Find the VPC
data "aws_vpc" "mongovpc" {
    tags = {
        Name = "mongovpc"
    }
}

# Get the subnet IDs
data "aws_subnet_ids" "mongovpc_subnets" {
  vpc_id = data.aws_vpc.mongovpc.id
}