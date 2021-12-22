#!/usr/bin/env python 

import ovh
import json

domain='{{lookup('env','TF_DOMAIN')}}'
project="{{lookup('env','OVH_PROJECT')}}"
instance="{{lookup('env','OVH_INSTANCE')}}"

client = ovh.Client(
    endpoint="{{lookup('env','OVH_ENDPOINT')}}",
    application_key="{{lookup('env','OVH_APP_KEY')}}",
    application_secret="{{lookup('env','OVH_APP_SECRET')}}",
    consumer_key="{{lookup('env','OVH_CONSUMER_KEY')}}",
)

endpoint=f'/domain/zone/{domain}/record'

{% for h in groups['proxy'] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{lookup('env','TF_FQDN')}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))

result = client.post( endpoint,
    fieldType='A',
    subDomain='{{hostvars[h].inventory_hostname}}.{{lookup('env','TF_DOMAIN')}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}

{% for h in groups['server'] %}
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{hostvars[h].inventory_hostname}}.{{lookup('env','TF_DOMAIN')}}.', 
    target="{{hostvars[h].ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))
{% endfor %}


endpoint=f'/domain/zone/{domain}/refresh'
result = client.post(endpoint)
print (f"POST {endpoint}")
 