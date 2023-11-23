resource "aws_network_interface" "nic" {
  subnet_id   = var.subnet_id
  private_ips = var.private_ips

  tags = {
    Name = "${var.nic_name}-nic"
  }
}
