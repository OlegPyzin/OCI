# Manual
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment
resource "oci_identity_compartment" "openvpn" {
    # All below are - required
    #--------------------------
    # Поскольку создается второй уровень compartment
    # то используется tenancy_ocid,
    # для идентификации вышестоящего уровня compartment
    compartment_id = var.tenancy_ocid
    description = "OpenVPN server for my own use."
    name = "OpenVPN"

    # All below are - optional
    #--------------------------
    # Установка переменной для возможности удаления compartment
    # по умолчанию установлена в false
    enable_delete = true
    #defined_tags = {"Operations.CostCenter"= "42"}
    freeform_tags = {"Hobby"= "OpenVPN"}
}

resource "oci_identity_compartment" "k8s" {
    # All below are - required
    #--------------------------
    compartment_id = var.tenancy_ocid
    description = "Place for the kubernetes nodes."
    name = "k8s"

    # All below are - optional
    #--------------------------
    enable_delete = true
    freeform_tags = {"Hobby"= "For Kubernetes nodes."}
}