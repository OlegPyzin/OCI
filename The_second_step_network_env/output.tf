# File: output.tf
# Oracle Cloud Infrastructure
#----------------------------
# Output information about Network resources
# in the VCN and OpenVPN service.
#--------------------------------------------------------
output "vcn_tenancy" {
  description = "Virtual Cloud Network for my Tenancy."
  value = oci_core_vcn.that.id
}

output "subnet_openvpn" {
  description = "SubNet ID to launch OpenVPN service for my own use."
  value = oci_core_subnet.openvpn.id
}

output "subnet_k8s" {
  description = "SubNet ID to launch kubernetes nodes for my own use."
  value = oci_core_subnet.k8s.id
}

# writting information about created
# VCN and SubNets in the OCI
# for the next use and for memory.
resource "local_file" "network" {
  filename = "./output/network.lst"
  content = "${oci_core_vcn.that.vcn_domain_name}\nid = ${oci_core_vcn.that.id}\n\n${oci_core_subnet.openvpn.dns_label}\nid = ${oci_core_subnet.openvpn.id}"
}
