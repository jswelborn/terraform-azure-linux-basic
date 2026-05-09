/*
resource "aws_instance" "windows_instance" {
  ami                    = "ami-0798c9ebaf695e14e"
  instance_type          = "t3.large"
  subnet_id              = "subnet-9751e7ce"
  vpc_security_group_ids = ["sg-4d963729"]
  key_name               = "HETLX_ETG_US_EAST_1"

  root_block_device {
    volume_size = 128
    volume_type = "gp3"
  }

  tags = local.aws_windows_tags
}
*/