output "ec2_dns_names" {
    value = [aws_instance.mongo_cluster.*.public_dns]
}