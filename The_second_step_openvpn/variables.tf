# All variables are defined in the terraform.tfvars file
# in the form of:
#--------------------------------------------------------
# tenancy_ocid     = "ocid1.tenancy.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# region           = "eu-stockholm-1"
# user_ocid        = "ocid1.user.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# fingerprint      = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
# private_key_path = "/path/to/your/filename.pem"
#--------------------------------------------------------
variable "region" {
    description = "Name of region where tenancy is placed"
    type = string
}

variable "tenancy_ocid" {
    description = "Name of TENANCY in account"
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
