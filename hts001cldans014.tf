/*
resource "aws_instance" "linux_instance" {
  ami                    = "ami-0d5e8769671b48387"
  instance_type          = "t3.large"
  subnet_id              = "subnet-9751e7ce"
  vpc_security_group_ids = ["sg-4d963729"]
  key_name               = "HETLX_ETG_US_EAST_1"

  root_block_device {
    volume_size = 100
    volume_type = "gp3"
  }

  tags = local.aws_linux_tags
}
*/