# File: output.tf
# Oracle Cloud Infrastructure
#----------------------------
# Output information about available
# SHAPES in the OpenVPN compartment.
#--------------------------------------------------------
locals {
  shapes = data.oci_core_shapes.list.shapes
}

output "shapes" {
  description = "Available SHAPES in the OpenVPN compartment."
  value = data.oci_core_shapes.list.shapes
}

# writing information list of shapes
# in the OpenVPN compartment
# for the next use.
resource "local_file" "shapes" {

  count = length( data.oci_core_shapes.list.shapes )
  filename = "./output/${data.oci_core_shapes.list.shapes[count.index].name}"

  content = join( "\n", [
    "name = ${lookup( data.oci_core_shapes.list.shapes[count.index], "name", "none" )}",
    "billing_type   = ${lookup( data.oci_core_shapes.list.shapes[count.index], "billing_type", "none" )}",
    "memory_in_gbs  = ${lookup( data.oci_core_shapes.list.shapes[count.index], "memory_in_gbs", "none" )}",
    "network_ports  = ${lookup( data.oci_core_shapes.list.shapes[count.index], "network_ports", "none" )}",
    "max_vnic_attachments  = ${lookup( data.oci_core_shapes.list.shapes[count.index], "max_vnic_attachments", "none" )}",
    "networking_bandwidth_in_gbps = ${lookup( data.oci_core_shapes.list.shapes[count.index], "networking_bandwidth_in_gbps", "none" )}",
    "ocpus                 = ${lookup( data.oci_core_shapes.list.shapes[count.index], "ocpus", "none" )}",
    "processor_description = ${lookup( data.oci_core_shapes.list.shapes[count.index], "processor_description", "none" )}",
  ] )
}

# To get all possible characteristics of shape for the VM.
resource "local_file" "contents" {

  filename = "./output/contents"

  content = join( "\n", keys( data.oci_core_shapes.list.shapes[0] ) )
}
