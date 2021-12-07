resource "openstack_compute_keypair_v2" "terrabuilder" {
  provider   = openstack.ovh # Provider name declared in provider.tf
  name       = "infrabuilder" # Name of the SSH key to use for creation
  public_key = file("id_rsa.pub") # Path to your previously generated SSH key
}