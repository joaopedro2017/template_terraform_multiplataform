module "nic_elastic_compute_cloud" {
  source      = "../../aws/networking/network_interface"
  count       = length(var.MaquinaVirtualEC2["NomeInstancias"]) > 0 ? 1 : 0
  subnet_id   = module.subnet_elastic_compute_cloud[0].id
  nic_name    = var.MaquinaVirtualEC2.NomeInstancias[count.index]
  private_ips = ["172.16.10.100"]
}
