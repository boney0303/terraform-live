remote_state {
  backend = "s3"
  config = {
    bucket  = "${get_env("TF_VAR_env", "dev")}-${get_env("TF_VAR_region", "us-east-1")}-terraform-state"
    key     = "${path_relative_to_include("root")}/${get_env("TF_VAR_stack_name", "default")}-terraform.tfstate"
    region  = "${get_env("TF_VAR_region", "us-east-1")}"
    skip_region_validation = true
    encrypt = true
    dynamodb_table = "terraform-lock-table-demo-app"
    s3_bucket_tags = {
      owner = "samarendra.bisoyi"
      name  = "Terraform state storage for webapp demo"
    }
    dynamodb_table_tags = {
      owner = "samarendra.bisoyi"
      name  = "Terraform lock table for webapp demo"
    }
  }
}
terraform {
  # Force Terraform to keep trying to acquire a lock for up to 20 minutes if someone else already has the lock
    extra_arguments "init_input_false" {
      commands = ["init"]
      arguments = ["-input=false"]
    }
    extra_arguments "retry_lock" {
      commands  = get_terraform_commands_that_need_locking()
      arguments = ["-lock-timeout=20m"]
  }
    extra_arguments "global_vars" {
      commands = get_terraform_commands_that_need_locking()
      required_var_files = [
        "${get_terragrunt_dir()}/../../../../env/${get_env("TF_VAR_env", "dev")}/account.tfvars",
        "${get_terragrunt_dir()}/../../../../env/${get_env("TF_VAR_env", "dev")}/${get_env("TF_VAR_region", "us-east-1")}/region.tfvars",
        "${get_terragrunt_dir()}/../../../../env/${get_env("TF_VAR_env", "dev")}/${get_env("TF_VAR_region", "us-east-1")}/demo_app_vars/${get_env("TF_VAR_stack_name", "demo-app")}.tfvars"
      ]
  }
}

