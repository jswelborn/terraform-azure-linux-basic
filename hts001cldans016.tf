resource "aws_instance" "windows_instance" {
  ami                    = "ami-0798c9ebaf695e14e"
  instance_type          = "t3.large"
  subnet_id              = "subnet-9751e7ce"
  vpc_security_group_ids = ["sg-4d963729"]
  key_name               = "HETLX_ETG_US_EAST_1"

  user_data = <<-EOF
<powershell>
$ErrorActionPreference = "Stop"

$Username = "hetwinadmin"
$Password = ConvertTo-SecureString "${var.hetwinadmin_default_password}" -AsPlainText -Force

if (-not (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue)) {
  New-LocalUser -Name $Username -Password $Password -PasswordNeverExpires -AccountNeverExpires
}

Add-LocalGroupMember -Group "Administrators" -Member $Username -ErrorAction SilentlyContinue

winrm quickconfig -q
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

Enable-PSRemoting -Force
Set-Service WinRM -StartupType Automatic
Start-Service WinRM

New-NetFirewallRule -DisplayName "Allow WinRM HTTP" -Direction Inbound -Protocol TCP -LocalPort 5985 -Action Allow -ErrorAction SilentlyContinue
</powershell>
EOF

  root_block_device {
    volume_size = 128
    volume_type = "gp3"
  }

  tags = local.aws_windows_tags
}