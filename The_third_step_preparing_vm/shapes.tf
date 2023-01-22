# File: shapes.tf
# Oracle Cloud Infrastructure
#----------------------------
data "oci_core_shapes" "list" {
    #Required
    compartment_id = var.compartment_id_openvpn

    #Optional
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = "${var.compartment_id_openvpn}"
}
