locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  #environment_vars = yamldecode(file("${find_in_parent_folders("env.hcl")}"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  #source = "https://github.com/boney0303/terraform-modules.git//ec2"
  source = "git::git@github.com:boney0303/terraform-modules.git//ec2"
  #source = "../../../../../terraform-modules//ec2"
}

#to prevent from terragrunt destroy
#prevent_destroy = true

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "devops_${local.env}"
  instance_type = "t2.micro"
  subnet_id = "subnet-05978ee2148fccb88"
}
