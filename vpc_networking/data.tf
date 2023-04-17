# Availability Zones list out

data "aws_availability_zones" "available" {
  state = "available"
}
