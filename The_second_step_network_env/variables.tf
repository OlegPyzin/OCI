# File: variables.tf
# Oracle Cloud Infrastructure
#----------------------------
# All variables are defined in the terraform.tfvars file
# in the form of:
# Have a look at the terraform.tfvars.example
#--------------------------------------------------------
variable "region" {
    description = "Name of region where tenancy is placed"
    type = string
}

variable "tenancy_ocid" {
    description = "Name of TENANCY in account"
    type = string
}

variable "compartment_id_openvpn" {
    description = "Name of COMPARTMENT for the OpenVPN service."
    type = string
}

variable "compartment_id_k8s" {
    description = "Name of COMPARTMENT for the k8s nodes."
    type = string
}

variable "user_ocid" {
    description = "User Oracle Cloud Identificator"
    type = string
}

variable "fingerprint" {
    description = "User account fingerprint"
    type = string
}

variable "private_key_path" {
    description = "User private key PATH"
    type = string
}

variable "vcn_display_name" {
    description = "Name of Virtual Cloud Network in the OCI"
    type = string
}

variable "vcn_dns_label" {
    description = "Name of DNS in the VCN in the OCI"
    type = string
}

variable "vcn_cidr_block" {
    description = "CIDR block of Virtual Cloud Network in the OCI"
    type = string
}

variable "subnet_display_name_openvpn" {
    description = "Name of subnet for the openvpn in the VCN in the OCI"
    type = string
}

variable "subnet_dns_label_openvpn" {
    description = "Name of DNS of subnet for the openvpn in the VCN in the OCI"
    type = string
}

variable "subnet_cidr_block_openvpn" {
    description = "CIDR block of subnet for the openvpn in the VCN in the OCI"
    type = string
}

variable "subnet_display_name_k8s" {
    description = "Name of subnet in the VCN for the k8s in the OCI"
    type = string
}

variable "subnet_dns_label_k8s" {
    description = "Name of DNS of subnet for the k8s in the VCN in the OCI"
    type = string
}

variable "subnet_cidr_block_k8s" {
    description = "CIDR block of subnet in the VCN for the k8s in the OCI"
    type = string
}

variable "vcn_freeform_tags" {
    description = "Name of free form Tags."
    type = map(string)
}
#--------------------------------------------------------
# End of file: variables.tf
#--------------------------------------------------------
