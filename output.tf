output "availability_domains_ads" {
  description = "Available Domains in the Tenancy."
  value = data.oci_identity_availability_domains.ads.availability_domains[*].name
}

# Oracle Cloud Infrastructure has got only one
# available domain in the Stockholm region,
# so we can read only one element of object.
resource "local_file" "availability_domains_ads" {
  filename = "./output/availability_domains_ads.lst"
  content = data.oci_identity_availability_domains.ads.availability_domains[0].name
}
