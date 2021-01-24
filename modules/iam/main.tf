resource "aws_iam_role" "microservice_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_policy" "microservice_deploy_policy" {
  name        = var.role_policy_name
  description = "Permissions for microservice to deploy perform operations on S3 and encrypt/decrypt"
  policy      = data.aws_iam_policy_document.microservice_policy.json

}

resource "aws_iam_role_policy_attachment" "deploy_attachment" {
  role       = aws_iam_role.microservice_role.name
  policy_arn = aws_iam_policy.microservice_deploy_policy.arn
}

# To be attached to the microservice cloud instance. Gives it the necessary permissions to access the S3 and kms resources
resource "aws_iam_instance_profile" "microservice_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.microservice_role.name
}