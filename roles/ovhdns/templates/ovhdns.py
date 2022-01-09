#!/usr/bin/env python 

import ovh
import json

domain="{{domain}}"
project="{{project}}"
instance="{{instance}}"

client = ovh.Client(
    endpoint="{{endpoint}}",
    application_key="{{application_key}}",
    application_secret="{{application_secret}}",
    consumer_key="{{consumer_key}}",
)
endpoint=f'/domain/zone/{domain}/record'

{% for h in groups[deployment+'-proxy-'+active] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{gmm_fqdn}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

{% for h in groups[deployment+'-proxy-green'] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{gmm_fqdn_green}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

{% for h in groups[deployment+'-proxy-blue'] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{gmm_fqdn_blue}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

{% for h in groups[deployment+'-backend-green'] + groups[deployment+'-backend-blue'] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{hostvars[h].inventory_hostname}}.{{domain}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

{% for h in groups[deployment+'-cmk-green'] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{hostvars[h].inventory_hostname}}.{{domain}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

{% for h in groups[deployment+'-cmk-'+active] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{cmk_fqdn}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

endpoint=f'/domain/zone/{domain}/refresh'
result = client.post(endpoint)
print (f"POST {endpoint}")
 