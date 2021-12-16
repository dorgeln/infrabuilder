resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-proxygreen" {
   name        = "{{ TF_PROVIDER }}-proxygreen" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     ansible_group = "proxy"
     ansible_user = "ubuntu"
     ansible_hostvars="{'color':'green'}"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-proxyblue" {
   name        = "{{ TF_PROVIDER }}-proxyblue" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     ansible_group = "proxy"
     ansible_user = "ubuntu"
     ansible_hostvars="{'color':'blue','debug':True}"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-microgreen" {
   name        = "{{ TF_PROVIDER }}-microgreen" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     ansible_group = "micro"
     ansible_user = "ubuntu"
     ansible_hostvars="{'color':'green'}"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-microblue" {
   name        = "{{ TF_PROVIDER }}-microblue" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     ansible_group = "micro"
     ansible_user = "ubuntu"
     ansible_hostvars="{'color':'blue'}"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}