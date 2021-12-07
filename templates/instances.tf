resource "openstack_compute_instance_v2" "tf1-{{ TF_PROVIDER }}" {
   name        = "tf1-{{ TF_PROVIDER }}" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     ansible_group = "infrabuilder"
     ansible_user = "ubuntu"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}
