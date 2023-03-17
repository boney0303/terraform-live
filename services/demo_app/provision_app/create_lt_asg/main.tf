data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "${var.env}-${var.region}-terraform-state"
    key    = "provision_app/create_alb/${var.stack_name}-terraform.tfstate"
    region = var.region
  }
}

data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20220218.1-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["137112412989"] # Canonical
}


module "demo_webapp_lt" {
 #source = "../../../../env/terrafiles/terraform-modules/webapp_lt"
  source = "../../../../../terraform-modules/webapp_lt"

  ec2_security_grps    = var.webapp_sgs
  iam_instance_profile = var.iam_instance_profile
  image_id             = data.aws_ami.amazon.image_id
  #image_id             = "ami-031de1a91f8ea1c19"
  instance_type        = var.instance_type
  region               = var.region
  ssh_key              = var.ssh_key
  stack_name           = var.stack_name
  tags                 = local.tags

}

module "demo_webapp_asg" {
  #source = "../../../env/terrafiles/terraform-modules/webapp_asg"
  source = "../../../../../terraform-modules/webapp_asg"

  asg_max              = var.asg_max
  asg_min              = var.asg_min
  asg_desired_capacity = var.asg_desired_capacity

  #elb_name            = [data.terraform_remote_state.elb.elb_name]

  alb_tg_arns          = data.terraform_remote_state.alb.outputs.target_group_arns

  region      = var.region
  stack_name  = var.stack_name

  webapp_lt = module.demo_webapp_lt.lt_id

  vpc_zone_identifier       = local.instance_public_subnet
  wait_for_elb_cap          = var.wait_for_elb_cap
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
}
