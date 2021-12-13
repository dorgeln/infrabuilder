# terraform-infrabuilder
Deploying infrastructure with terraform & github actions

### Configuration

Your existing openstack configuration can be imported into github secrects using:

```
source openrc.sh 
gh secret set OS_AUTH_URL --body "$OS_AUTH_URL"
gh secret set OS_IDENTITY_API_VERSION --body "$OS_IDENTITY_API_VERSION"
gh secret set OS_USER_DOMAIN_NAME --body "$OS_USER_DOMAIN_NAME"
gh secret set OS_PROJECT_DOMAIN_NAME --body "$OS_PROJECT_DOMAIN_NAME"
gh secret set OS_TENANT_ID --body "$OS_TENANT_ID"
gh secret set OS_USERNAME --body "$OS_USERNAME"
gh secret set OS_PASSWORD --body "$OS_PASSWORD"
gh secret set OS_REGION_NAME --body "$OS_REGION_NAME"
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
source .env;ansible-playbook --playbook-dir . -i tf_inventory.yml site.yml
```