resource "openstack_compute_instance_v2" "micromamba-proxy-alpha-{{ TF_PROVIDER }}" {
   name        = "micromamba-proxy-alpha-{{ TF_PROVIDER }}" # Instance name
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

resource "openstack_compute_instance_v2" "micromamba-proxy-bravo-{{ TF_PROVIDER }}" {
   name        = "micromamba-proxy-bravo-{{ TF_PROVIDER }}" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "proxy"
     ansible_user = "ubuntu"
     domain = "mamba.pm"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "micromamba-server-green-alpha-{{ TF_PROVIDER }}" {
   name        = "micromamba-server-green-alpha-{{ TF_PROVIDER }}" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "ubuntu"
     domain = "mamba.pm"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "micromamba-server-green-bravo-{{ TF_PROVIDER }}" {
   name        = "micromamba-server-green-bravo-{{ TF_PROVIDER }}" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "ubuntu"
     domain = "mamba.pm"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "micromamba-server-blue-alpha-{{ TF_PROVIDER }}" {
   name        = "micromamba-server-blue-alpha-{{ TF_PROVIDER }}" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "ubuntu"
     domain = "mamba.pm"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}


resource "openstack_compute_instance_v2" "micromamba-server-blue-bravo-{{ TF_PROVIDER }}" {
   name        = "micromamba-server-blue-bravo-{{ TF_PROVIDER }}" # Instance name
   provider    = openstack.ovh  # Provider name
   image_name  = "Ubuntu 20.04" # Image name
   flavor_name = "s1-2" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "ubuntu"
     domain = "mamba.pm"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.infrabuilder-{{ TF_PROVIDER }}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}