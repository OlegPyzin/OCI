# Manual
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment
resource "oci_identity_compartment" "openvpn" {
    #Required
    compartment_id = var.tenancy_ocid
    description = "OpenVPN server for my own use."
    name = "OpenVPN"

    #Optional
    enable_delete = true
    #defined_tags = {"Operations.CostCenter"= "42"}
    freeform_tags = {"Hobby"= "OpenVPN"}
}