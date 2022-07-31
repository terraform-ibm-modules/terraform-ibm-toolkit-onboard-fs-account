
/*
Defines the MFA trait for the account. Valid values:

    NONE - No MFA trait set
    TOTP - For all non-federated IBMId users
    TOTP4ALL - For all users
    LEVEL1 - Email-based MFA for all users
    LEVEL2 - TOTP-based MFA for all users
    LEVEL3 - U2F MFA for all users
*/

module setup_clis {
  source = "cloud-native-toolkit/clis/util"

  clis = ["ibmcloud-cr"]
}

/*
Defines whether or not creating platform API and Service Id is access controlled. Valid values:

    RESTRICTED - to apply access control
    NOT_RESTRICTED - to remove access control
    NOT_SET - to 'unset' a previous set value

*/
resource ibm_iam_account_settings iam_account_settings_instance {
  mfa = var.mfa  
  restrict_create_service_id = var.restrict_create_service_id
  restrict_create_platform_apikey = var.restrict_create_platform_apikey
}


//container registry plateform-matrics
/*--enable   Enable the setting for your account.
   --disable  Disable the setting for your account.
   --status   Display whether the setting is enabled for your account.
*/
resource null_resource platform_metrics {
  provisioner "local-exec" {
    command = "${path.module}/scripts/platform-metrics.sh ${var.region} ${var.action}"

    environment = {
      IBMCLOUD_API_KEY = var.ibmcloud_api_key
      BIN_DIR = module.setup_clis.bin_dir
    }
  }
}
