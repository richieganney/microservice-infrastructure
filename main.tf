module "kms" {
  source                  = "./modules/kms"
  key_alias               = var.key_alias
  deletion_window_in_days = var.deletion_window_in_days
}

module "s3_initial" {
  source                   = "./modules/s3"
  acl                      = var.acl
  sse_algorithm            = var.sse_algorithm
  bucket_prefix            = "initial-${var.bucket_prefix}"
  kms_master_key_arn       = module.kms.aws_kms_key_arn
  microservice_instance_ip = var.microservice_instance_ip
}

module "s3_final" {
  source                   = "./modules/s3"
  acl                      = var.acl
  sse_algorithm            = var.sse_algorithm
  bucket_prefix            = "final-${var.bucket_prefix}"
  kms_master_key_arn       = module.kms.aws_kms_key_arn
  microservice_instance_ip = var.microservice_instance_ip
}

module "iam" {
  source                = "./modules/iam"
  role_name             = var.role_name
  role_policy_name      = var.role_policy_name
  instance_profile_name = var.instance_profile_name
  bucket_arns           = [module.s3_initial.s3_bucket_arn, module.s3_final.s3_bucket_arn]
  kms_master_key_arn    = module.kms.aws_kms_key_arn
}