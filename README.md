# terraform-infrabuilder
Deploying infrastructure with terraform & github actions

### Configuration

Your existing openstack configuration can be imported into github secrects using:

```
source .env

#### 
gh secret set DEPLOYMENT --body "gmm"
gh secret set WORKSPACE --body "prod"
gh secret set ACTIVE --body "$ACTIVE"
gh secret set DOMAIN --body "$DOMAIN"
gh secret set PROVIDER --body "$PROVIDER"
gh secret set USER --body "$USER"
gh secret set EMAIL --body "$EMAIL"
gh secret set STAGING --body "$STAGING"
gh secret set GMM_HOSTNAME --body "$GMM_HOSTNAME"
gh secret set GMM_HOSTNAME_GREEN --body "$GMM_HOSTNAME_GREEN"
gh secret set GMM_HOSTNAME_BLUE --body "$GMM_HOSTNAME_BLUE"
gh secret set GMM_PROXY_GREEN_REGIONS --body "$GMM_PROXY_GREEN_REGIONS"
gh secret set GMM_PROXY_GREEN_IMAGE --body "$GMM_PROXY_GREEN_IMAGE"
gh secret set GMM_PROXY_GREEN_FLAVOR --body "$GMM_PROXY_GREEN_FLAVOR"
gh secret set GMM_BACKEND_GREEN_REGIONS --body "$GMM_BACKEND_GREEN_REGIONS"
gh secret set GMM_BACKEND_GREEN_IMAGE --body "$GMM_BACKEND_GREEN_IMAGE"
gh secret set GMM_BACKEND_GREEN_FLAVOR --body "$GMM_BACKEND_GREEN_FLAVOR"
gh secret set GMM_PROXY_BLUE_REGIONS --body "$GMM_PROXY_BLUE_REGIONS"
gh secret set GMM_PROXY_BLUE_IMAGE --body "$GMM_PROXY_BLUE_IMAGE"
gh secret set GMM_PROXY_BLUE_FLAVOR --body "$GMM_PROXY_BLUE_FLAVOR"
gh secret set GMM_BACKEND_BLUE_REGIONS --body "$GMM_BACKEND_BLUE_REGIONS"
gh secret set GMM_BACKEND_BLUE_IMAGE --body "$GMM_BACKEND_BLUE_IMAGE"
gh secret set GMM_BACKEND_BLUE_FLAVOR --body "$GMM_BACKEND_BLUE_FLAVOR"
gh secret set CMK_HOSTNAME --body "$CMK_HOSTNAME"
gh secret set CMK_HOSTNAME_GREEN --body "$CMK_HOSTNAME_GREEN"
gh secret set CMK_HOSTNAME_BLUE --body "$CMK_HOSTNAME_BLUE"
gh secret set CMK_PASSWORD --body "$CMK_PASSWORD"
gh secret set CMK_SECRET --body "$CMK_SECRET"
gh secret set CMK_GREEN_REGIONS --body "$CMK_GREEN_REGIONS"
gh secret set CMK_GREEN_IMAGE --body "$CMK_GREEN_IMAGE"
gh secret set CMK_GREEN_FLAVOR --body "$CMK_GREEN_FLAVOR"
gh secret set CMK_BLUE_REGIONS --body "$CMK_BLUE_REGIONS"
gh secret set CMK_BLUE_IMAGE --body "$CMK_BLUE_IMAGE"
gh secret set CMK_BLUE_FLAVOR --body "$CMK_BLUE_FLAVOR"
gh secret set TF_VAR_endpoint --body "$TF_VAR_endpoint"
gh secret set TF_VAR_application_key --body "$TF_VAR_application_key"
gh secret set TF_VAR_application_secret --body "$TF_VAR_application_secret"
gh secret set TF_VAR_consumer_key --body "$TF_VAR_consumer_key"
gh secret set TF_VAR_project --body "$TF_VAR_project"
gh secret set TF_VAR_instance --body "$TF_VAR_instance"
gh secret set TF_VAR_auth_url --body "$TF_VAR_auth_url"
gh secret set TF_VAR_user_name --body "$TF_VAR_user_name"
gh secret set TF_VAR_password --body "$TF_VAR_password"
gh secret set TF_VAR_user_domain_name --body "$TF_VAR_user_domain_name"
gh secret set TF_VAR_tenant_name --body "$TF_VAR_tenant_name"
gh secret set TF_VAR_tenant_id --body "$TF_VAR_tenant_id"
gh secret set SSH_KEY_PUB --body "$SSH_KEY_PUB"
gh secret set SSH_KEY_PRIV --body "$SSH_KEY_PRIV"
```

Set SSH_DEPLOY_KEY for state repository.
gh secret set SSH_DEPLOY_KEY --body "$SSH_DEPLOY_KEY"

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