# terraform-infrabuilder
Deploying infrastructure with terraform & github actions

### Configuration

Your existing openstack configuration can be imported into github secrects using:

```
source .env
gh secret set TF_PROVIDER --body "prod"
gh secret set OS_AUTH_URL --body "$OS_AUTH_URL"
gh secret set OS_IDENTITY_API_VERSION --body "$OS_IDENTITY_API_VERSION"
gh secret set OS_USER_DOMAIN_NAME --body "$OS_USER_DOMAIN_NAME"
gh secret set OS_PROJECT_DOMAIN_NAME --body "$OS_PROJECT_DOMAIN_NAME"
gh secret set OS_TENANT_ID --body "$OS_TENANT_ID"
gh secret set OS_USERNAME --body "$OS_USERNAME"
gh secret set OS_PASSWORD --body "$OS_PASSWORD"

gh secret set OVH_ENDPOINT --body "$OVH_ENDPOINT"
gh secret set OVH_APP_KEY --body "$OVH_APP_KEY"
gh secret set OVH_APP_SECRET --body "$OVH_APP_SECRET"
gh secret set OVH_CONSUMER_KEY --body "$OVH_CONSUMER_KEY"
gh secret set OVH_ENDPOINT --body "$OVH_ENDPOINT"
gh secret set OVH_PROJECT --body "$OVH_PROJECT"
gh secret set OVH_INSTANCE --body "$OVH_INSTANCE"
```

Set SSH_DEPLOY_KEY for state repository.

### Debugging

Additional debuging output can be enabled/disabled with:

```
gh secret set ACTIONS_STEP_DEBUG --body "true"
gh secret set ACTIONS_STEP_DEBUG --body "false"
```

### Run localy 

```
source .env;ansible-playbook -e "SSH_KEY_PUB='$SSH_KEY_PUB'" -e "SSH_KEY_PRIV='$SSH_KEY_PRIV'" -e "TF_PROVIDER='$TF_PROVIDER'" tf_config.yml
source .env;ansible-playbook tf_apply.yml
ansible-inventory --playbook-dir . -i tf_inventory.yml --list
source .env;ansible-playbook -i tf_inventory.yml site.yml \
    -e "TF_PROVIDER='$TF_PROVIDER'" -e "OVH_ENDPOINT='$OVH_ENDPOINT'" \
    -e "OVH_APP_KEY='$OVH_APP_KEY'" -e "OVH_APP_SECRET='$OVH_APP_SECRET'" \
    -e "OVH_CONSUMER_KEY='$OVH_CONSUMER_KEY'" -e "OVH_PROJECT='$OVH_PROJECT'" \
    -e "OVH_INSTANCE='$OVH_INSTANCE'" 
```