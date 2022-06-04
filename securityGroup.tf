# Security Group
resource "aws_security_group" "mongo_sg" {
    name_prefix = "mongo_sg"
    description = "Allow ports for MongoDB cluster"
    vpc_id = data.aws_vpc.mongovpc.id
}

resource "aws_security_group_rule" "mongo_sg_ingress_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.mongo_sg.id 
    description = "Allow inbound SSH from anywhere"
}

resource "aws_security_group_rule" "mongo_sg_ingress_mongo" {
    type = "ingress"
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.mongo_sg.id 
    description = "Allow inbound MongoDB port from anywhere"
}

resource "aws_security_group_rule" "mongo_sg_egress_all" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.mongo_sg.id 
    description = "Allow all output"
}