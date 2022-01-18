
resource "ovh_domain_zone_record" "{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}_dns_rr" {
  zone      = "{{domain}}"
  subdomain = "{{hostname}}"
  fieldtype = "A"
  target    = "${openstack_compute_instance_v2.{{deployment}}-{{workspace}}-{{id}}-{{color}}-{{region|lower}}.network[0].fixed_ip_v4}"
}
