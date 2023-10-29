resource "aws_kms_key" "this" {
  enable_key_rotation     = var.enable_key_rotation
  deletion_window_in_days = var.deletion_window_in_days
  description             = var.description
  is_enabled              = var.is_enabled
  multi_region            = var.multi_region
  policy                  = var.policy

  tags = merge(
    local.tags,
    tomap({ "Name" = "${local.naming.display} KMS Key" })
  )
}
resource "aws_kms_alias" "this" {
  target_key_id = aws_kms_key.this.arn
  name          = "alias/${local.naming.resource}"
}
