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