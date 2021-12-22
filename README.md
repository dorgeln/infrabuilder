# terraform-infrabuilder
Deploying infrastructure with terraform & github actions

### Configuration

Your existing openstack configuration can be imported into github secrects using:

```
source .env

gh secret set TF_FQDN --body "mm.mamba.pm"
gh secret set TF_WORKSPACE --body "prod"
gh secret set OVH_FLAVOR --body "d2-8"

gh secret set TF_DOMAIN --body "$TF_DOMAIN"
gh secret set TF_DEPLOYMENT --body "$TF_DEPLOYMENT"
gh secret set TF_PROVIDER --body "$TF_PROVIDER"

gh secret set OS_AUTH_URL --body "$OS_AUTH_URL"
gh secret set OS_IDENTITY_API_VERSION --body "$OS_IDENTITY_API_VERSION"
gh secret set OS_USER_DOMAIN_NAME --body "$OS_USER_DOMAIN_NAME"
gh secret set OS_PROJECT_DOMAIN_NAME --body "$OS_PROJECT_DOMAIN_NAME"
gh secret set OS_TENANT_ID --body "$OS_TENANT_ID"
gh secret set OS_TENANT_NAME --body "$OS_TENANT_NAME"
gh secret set OS_USERNAME --body "$OS_USERNAME"
gh secret set OS_PASSWORD --body "$OS_PASSWORD"
gh secret set OS_REGION_NAME --body "$OS_REGION_NAME"

gh secret set OVH_IMAGE --body "$OVH_IMAGE"
gh secret set OVH_USER --body "$OVH_USER"
gh secret set OVH_ENDPOINT --body "$OVH_ENDPOINT"
gh secret set OVH_APP_KEY --body "$OVH_APP_KEY"
gh secret set OVH_APP_SECRET --body "$OVH_APP_SECRET"
gh secret set OVH_CONSUMER_KEY --body "$OVH_CONSUMER_KEY"
gh secret set OVH_PROJECT --body "$OVH_PROJECT"
gh secret set OVH_INSTANCE --body "$OVH_INSTANCE"

gh secret set SSH_KEY_PUB --body "$SSH_KEY_PUB"
gh secret set SSH_KEY_PRIV --body "$SSH_KEY_PRIV"
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
source .env;ansible-playbook site.yml
```