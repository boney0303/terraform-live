provider "aws" {
  region = var.region
  max_retries = var.max_retries
  assume_role {
    role_arn = var.tf_role_arn
    session_name = "demo_webapp_session"
  }
}
