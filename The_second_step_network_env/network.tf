# File: network.tf
# Oracle Cloud Infrastructure
#----------------------------
# Create:
# VCN
# subnets
# Gateway
# route table
#--------------------------------------------------------
#
resource "oci_core_vcn" "that" {
  # Required
  compartment_id = var.tenancy_ocid
  #
  # Optional
  cidr_block = var.vcn_cidr_block
  # The next variable is using to put DNS name
  # in the fully qualified domain name
  # the DNS name of VM will be
  # vm_name.subnet_name.vcn_dns_label.oraclevcn.com
  dns_label  = var.vcn_dns_label
  #
  display_name = var.vcn_display_name
  freeform_tags = var.vcn_freeform_tags
  # ipv6 is disable by default
}

resource "oci_core_subnet" "openvpn" {
  # Required
  cidr_block     = var.subnet_cidr_block_openvpn
  compartment_id = var.compartment_id_openvpn
  vcn_id         = oci_core_vcn.that.id
  #
  # Optional
  display_name = var.subnet_display_name_openvpn
  dns_label = var.subnet_dns_label_openvpn
  route_table_id = oci_core_vcn.that.default_route_table_id
  dhcp_options_id = oci_core_vcn.that.default_dhcp_options_id
  freeform_tags = var.vcn_freeform_tags
}

resource "oci_core_subnet" "k8s" {
  # Required
  cidr_block     = var.subnet_cidr_block_k8s
  compartment_id = var.compartment_id_k8s
  vcn_id         = oci_core_vcn.that.id
  #
  # Optional
  display_name = var.subnet_display_name_k8s
  dns_label = var.subnet_dns_label_k8s
  route_table_id = oci_core_vcn.that.default_route_table_id
  dhcp_options_id = oci_core_vcn.that.default_dhcp_options_id
  freeform_tags = var.vcn_freeform_tags
}

resource "oci_core_internet_gateway" "that" {
  compartment_id = var.tenancy_ocid
  vcn_id = oci_core_vcn.that.id
  #
  display_name = var.vcn_display_name
  freeform_tags = var.vcn_freeform_tags
}

resource "oci_core_default_route_table" "that" {
  manage_default_resource_id = oci_core_vcn.that.default_route_table_id
  #
  route_rules {
    network_entity_id = oci_core_internet_gateway.that.id
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
  #
  display_name = var.vcn_display_name
  freeform_tags = var.vcn_freeform_tags
}

#--------------------------------------------------------
# End of file: network.tf
#--------------------------------------------------------