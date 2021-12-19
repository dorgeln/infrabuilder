resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-micromamba-proxy-green" {
   name        = "{{ TF_PROVIDER }}-micromamba-proxy-green" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "proxy"
     ansible_user = "ubuntu"
     hostname = "mmspg{{ TF_PROVIDER }}"
     domain = "mamba.pm"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-micromamba-proxy-blue" {
   name        = "{{ TF_PROVIDER }}-micromamba-proxy-blue" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "proxy"
     ansible_user = "ubuntu"
     hostname = "mmspg{{ TF_PROVIDER }}"
     domain = "mamba.pm"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-micromamba-server-green" {
   name        = "{{ TF_PROVIDER }}-micromamba-server-green" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "ubuntu"
     hostname = "mmssg{{ TF_PROVIDER }}"
     domain = "mamba.pm"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{ TF_PROVIDER }}-micromamba-server-blue" {
   name        = "{{ TF_PROVIDER }}-micromamba-server-blue" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "ubuntu"
     hostname = "mmssg{{ TF_PROVIDER }}"
     domain = "mamba.pm"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}