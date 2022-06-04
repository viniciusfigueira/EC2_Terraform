# EC2
resource "aws_instance" "mongo_cluster" {
  count = 3
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "aws-vinicius"
  security_groups = [aws_security_group.mongo_sg.id]
  subnet_id = tolist(data.aws_subnet_ids.mongovpc_subnets.ids)[count.index]
  tags = {
    Name = "mongo${count.index}"
  }
}

