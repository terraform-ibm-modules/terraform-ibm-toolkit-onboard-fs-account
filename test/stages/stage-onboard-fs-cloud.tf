module "dev_tools_mymodule" {
  source = "./module"

  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
  action = "enable"
  mfa = null
  restrict_create_service_id = "RESTRICTED"
  restrict_create_platform_apikey = "RESTRICTED"
}
