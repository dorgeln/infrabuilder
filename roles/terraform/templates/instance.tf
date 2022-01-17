resource "openstack_compute_instance_v2" "{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}" {
   name        = "{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}"  # Instance name
   provider    = {{provider}}  # Provider name
   region = "{{region}}"
   image_name  = "{{image}}" # Image name
   flavor_name = "{{flavour}}" # Instance type name
   metadata = {
     group = "{{deployment}}-{{id}}-{{color}}"
     ansible_user = "{{user}}"
     domain = "{{domain}}"
   }
   key_pair    = openstack_compute_keypair_v2.{{deployment}}-{{workspace}}-{{region|lower}}.name
   network {
    name      = "Ext-Net" 
   }
}

resource "ovh_domain_zone_record" "record_{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}" {
  zone      = "{{domain}}"
  subdomain = "{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}"
  fieldtype = "A"
  target    = "${openstack_compute_instance_v2.{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}.network[0].fixed_ip_v4}"
}
