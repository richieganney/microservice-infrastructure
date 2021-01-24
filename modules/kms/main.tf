resource "aws_kms_key" "key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "key" {
  name          = var.key_alias
  target_key_id = aws_kms_key.key.key_id
}