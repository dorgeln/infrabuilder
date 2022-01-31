../.micromamba/envs/default/bin/certbot certonly {% if staging %}--test-cert{% endif %} \
    --dns-ovh --non-interactive --agree-tos \
    -m {{email}} --dns-ovh-credentials ./ovh.ini \
    --cert-name {{fqdn}} -d {{fqdn}} \
    {% for d in aliases %}-d {{d}} {% endfor %} \
    {% for d in fqdns %}-d {{d}} {% endfor %} \
    {% for h in hostnames %}-d {{h}}.{{domain}} {% endfor %} \
    --work-dir ../{{certs}} --config-dir ../{{certs}} \
    --logs-dir ../{{certs}} --dns-ovh-propagation-seconds 60 

