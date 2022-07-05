locals {
  #  env         = trimprefix("${var.TFC_WORKSPACE_NAME}", "chaitu-")
  env         = var.ENV
  Environment = local.env == "dr" || local.env == "prod" ? "prod" : "nonpord"
  region      = local.env == "dr" || local.env == "prod" ? "us-east-2" : "us-east-1"
  tags = {
    "Environment"  = local.Environment
    "region"       = local.region
    "Service"      = "chaitu"
    "SupportGroup" = "Managed Services L2"
  }
  env_tag = {
    "appenv" = local.env
  }
}
variable "ENV" {}