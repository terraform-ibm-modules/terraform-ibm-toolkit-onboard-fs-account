# Starter kit for a Terraform module

This is a Starter kit to help with the creation of Terraform modules. The basic structure of a Terraform module is fairly
simple and consists of the following basic values:

- README.md - provides a description of the module
- main.tf - defiens the logic for the module
- variables.tf (optional) - defines the input variables for the module
- outputs.tf (optional) - defines the values that are output from the module

Beyond those files, any other content can be added and organized however you see fit. For example, you can add a `scripts/` directory
that contains shell scripts executed by a `local-exec` `null_resource` in the terraform module. The contents will depend on what your
module does and how it does it.

## Instructions for creating a new module

1. Update the title and description in the README to match the module you are creating
2. Fill out the remaining sections in the README template as appropriate
3. Implement your logic in the in the main.tf, variables.tf, and outputs.tf
4. Use releases/tags to manage release versions of your module

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- ibmcloud

### Terraform providers

- IBM Cloud provider >= 1.5.3
- 

## Module dependencies

This module makes use of the output from other modules:

- resource_group_name = "github.com/cloud-native-toolkit/terraform-ibm-resource-group.git"
## Example usage

```hcl-terraform
module "ibm_iam_account_settings" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-account-access-group?ref=v1.0.0"
  resource_group_name = module.resource_group.name
  region              = var.region  
  ibmcloud_api_key    = var.ibmcloud_api_key
  mfa = var.mfa  
  restrict_create_service_id = var.restrict_create_service_id
  restrict_create_platform_apikey = var.restrict_create_platform_apikey
}
```


Defines the MFA trait for the account. Valid values:

    NONE - No MFA trait set
    TOTP - For all non-federated IBMId users
    TOTP4ALL - For all users
    LEVEL1 - Email-based MFA for all users
    LEVEL2 - TOTP-based MFA for all users
    LEVEL3 - U2F MFA for all users



Defines whether or not creating platform API and Service Id is access controlled. Valid values:

    RESTRICTED - to apply access control
    NOT_RESTRICTED - to remove access control
    NOT_SET - to 'unset' a previous set value


container registry plateform-matrics
   --enable   Enable the setting for your account.
   --disable  Disable the setting for your account.
   --status   Display whether the setting is enabled for your account.

