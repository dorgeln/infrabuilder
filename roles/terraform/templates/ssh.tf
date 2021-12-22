resource "openstack_compute_keypair_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}" {
  provider   = {{lookup('env','TF_PROVIDER')}} # Provider name declared in provider.tf
  name       = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}" # Name of the SSH key to use for creation
  public_key = file("id_rsa.pub") # Path to your previously generated SSH key
}