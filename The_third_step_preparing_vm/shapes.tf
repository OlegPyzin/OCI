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

data "oci_core_images" "images" {
    #Required
    compartment_id = var.compartment_id_openvpn

    #Optional
    #display_name = var.image_display_name
    #operating_system = var.image_operating_system
    #operating_system_version = var.image_operating_system_version
    #shape = var.image_shape
    #state = var.image_state
    #sort_by = DISPLAYNAME
    #sort_order = ASC # The sort order to use, either ascending (ASC) or descending (DESC).
}
