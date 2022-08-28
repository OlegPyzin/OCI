provider "oci" {
    region	         = "${var.region}"
    tenancy_ocid     = "${var.tenancy_ocid}"
    user_ocid	     = "${var.user_ocid}"
    fingerprint	     = "${var.fingerprint}"
    private_key_path = "${var.private_key_path}"

    required_providers {
        # If needed specific version of OCI API
        # put it here
        # Can not use VARIABLE in this place
        # version = "${var.version}" will not work
        # version	         = ">= 3.27.0"
    }
}

