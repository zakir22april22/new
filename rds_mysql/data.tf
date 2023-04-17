data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["zk_vpc"]
  }
}
data "aws_subnet_ids" "available_db_subnet" {
  vpc_id = data.aws_vpc.vpc_available.id
  filter {
    name   = "tag:Name"
    values = ["zk_database*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_security_group" "zk_sg" {
  filter {
    name   = "tag:Name"
    values = ["zk_security_group"]
  }
}