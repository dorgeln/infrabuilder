#!/usr/bin/env python 

import ovh
import json

domain='mamba.pm'
project="{{ OVH_PROJECT }}"
instance="{{ OVH_INSTANCE }}"

client = ovh.Client(
    endpoint="{{ OVH_ENDPOINT }}",
    application_key="{{ OVH_APP_KEY }}",
    application_secret="{{ OVH_APP_SECRET }}",
    consumer_key="{{ OVH_CONSUMER_KEY }}",
)

endpoint=f'/domain/zone/{domain}/record'
result = client.post( endpoint,
    fieldType='A',
    subDomain='{{inventory_hostname}}.mamba.pm.', 
    target="{{ansible_host}}", 
    ttl=None,
)
print (f"POST {endpoint}",json.dumps(result, indent=4))

endpoint=f'/domain/zone/{domain}/refresh'
result = client.post(endpoint)
print (f"POST {endpoint}",json.dumps(result, indent=4))
 