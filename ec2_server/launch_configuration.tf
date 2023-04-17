resource "aws_launch_configuration" "lc" {
  name_prefix   = "zk_lc"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  user_data = data.template_file.user_data.rendered
  key_name = "my-key"
  associate_public_ip_address = true
  security_groups    = [data.aws_security_group.zk_sg.id]
  
  #lifecycle {
  #  create_before_destroy = true
  #}
}