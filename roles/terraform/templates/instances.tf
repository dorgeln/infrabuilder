resource "openstack_compute_instance_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-proxy-alpha" {
   name        = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-proxy-alpha" # Instance name
   provider    = {{lookup('env','TF_PROVIDER')}}  # Provider name
   image_name  = "{{lookup('env','OVH_IMAGE')}}" # Image name
   flavor_name = "{{lookup('env','OVH_FLAVOR')}}" # Instance type name
   metadata = {
     group = "proxy"
     ansible_user = "{{lookup('env','OVH_USER')}}"
     domain = "{{lookup('env','TF_DOMAIN')}}}"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-proxy-bravo" {
   name        = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-proxy-bravo" # Instance name
   provider    = {{lookup('env','TF_PROVIDER')}}  # Provider name
   image_name  = "{{lookup('env','OVH_IMAGE')}}" # Image name
   flavor_name = "{{lookup('env','OVH_FLAVOR')}}" # Instance type name
   metadata = {
     group = "proxy"
     ansible_user = "{{lookup('env','OVH_USER')}}"
     domain = "{{lookup('env','TF_DOMAIN')}}}"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-green-alpha" {
   name        = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-green-alpha" # Instance name
   provider    = {{lookup('env','TF_PROVIDER')}}  # Provider name
   image_name  = "{{lookup('env','OVH_IMAGE')}}" # Image name
   flavor_name = "{{lookup('env','OVH_FLAVOR')}}" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "{{lookup('env','OVH_USER')}}"
     domain = "{{lookup('env','TF_DOMAIN')}}}"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-green-bravo" {
   name        = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-green-bravo" # Instance name
   provider    = {{lookup('env','TF_PROVIDER')}}  # Provider name
   image_name  = "{{lookup('env','OVH_IMAGE')}}" # Image name
   flavor_name = "{{lookup('env','OVH_FLAVOR')}}" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "{{lookup('env','OVH_USER')}}"
     domain = "{{lookup('env','TF_DOMAIN')}}}"
     color = "green"
   }
   key_pair    = openstack_compute_keypair_v2.{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-blue-alpha" {
   name        = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-blue-alpha" # Instance name
   provider    = {{lookup('env','TF_PROVIDER')}}  # Provider name
   image_name  = "{{lookup('env','OVH_IMAGE')}}" # Image name
   flavor_name = "{{lookup('env','OVH_FLAVOR')}}" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "{{lookup('env','OVH_USER')}}"
     domain = "{{lookup('env','TF_DOMAIN')}}}"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}

resource "openstack_compute_instance_v2" "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-blue-bravo" {
   name        = "{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}-server-blue-bravo" # Instance name
   provider    = {{lookup('env','TF_PROVIDER')}}  # Provider name
   image_name  = "{{lookup('env','OVH_IMAGE')}}" # Image name
   flavor_name = "{{lookup('env','OVH_FLAVOR')}}" # Instance type name
   metadata = {
     group = "server"
     ansible_user = "{{lookup('env','OVH_USER')}}"
     domain = "{{lookup('env','TF_DOMAIN')}}}"
     color = "blue"
   }
   key_pair    = openstack_compute_keypair_v2.{{lookup('env','TF_DEPLOYMENT')}}-{{lookup('env','TF_WORKSPACE')}}.name
   network {
     name      = "Ext-Net" # Adds the network component to reach your instance
   }
}