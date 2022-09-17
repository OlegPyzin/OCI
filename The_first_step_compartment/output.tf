# Output informations about Compartments
output "compartment_openvpn" {
  description = "Compartment to launch OpenVPN server for my own use."
  value = oci_identity_compartment.openvpn.id
}

output "compartment_k8s" {
  description = "Compartment to launch kubernetes nodes for my own use."
  value = oci_identity_compartment.k8s.id
  #value = oci_identity_compartment.k8s.time_created
}

# writting information about created
# compartments in the OCI
# for the next use and for memory.
resource "local_file" "compartments" {
  filename = "./output/compartments.lst"
  content = "${oci_identity_compartment.openvpn.name}\n${oci_identity_compartment.openvpn.id}\n\n${oci_identity_compartment.k8s.name}\n${oci_identity_compartment.k8s.id}"
}
