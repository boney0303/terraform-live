#######################################
########## Account vars ###############
#######################################
# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.

owner          ="samarendra.bisoyi"
account_name   = "SamarB"
aws_account_id = "036476392584"
aws_profile    = "EC2-Prod-Instance-Profile"
max_retries    = 30

publically_accessible    = "false"
backup_retention_period  = 7

security_tags = {
  DeploymentEnvironment = "dev"
  ResourceOwner         = "samarendra.bisoyi"
  SecurityReview        = "NA"
}

account_tags = {
    env     = "dev"
}

ec2_instance_tags = {
    IntendedPublic = "false"
    Service        = "Webapp"
}