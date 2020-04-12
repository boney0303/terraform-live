# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = "SamarB"
  aws_account_id = "036476392584"
  aws_profile    = "EC2-Prod-Instance-Profile"
}
