resource "aws_iam_policy" "encrypt" {
  count = var.policy == null ? 1 : 0

  name   = "${local.naming.iam}KeyEncrypt"
  policy = data.aws_iam_policy_document.encrypt.json

  tags = merge(
    local.tags,
    tomap({ "Name" = "${local.naming.display} KMS Encrypt Policy" })
  )
}
resource "aws_iam_policy" "decrypt" {
  count = var.policy == null ? 1 : 0

  name   = "${local.naming.iam}KeyDecrypt"
  policy = data.aws_iam_policy_document.decrypt.json

  tags = merge(
    local.tags,
    tomap({ "Name" = "${local.naming.display} KMS Decrypt Policy" })
  )
}
resource "aws_iam_policy" "bicrypt" {
  count = var.policy == null ? 1 : 0

  name   = "${local.naming.iam}KeyBicrypt"
  policy = data.aws_iam_policy_document.bicrypt.json

  tags = merge(
    local.tags,
    tomap({ "Name" = "${local.naming.display} KMS Bicrypt Policy" })
  )
}
resource "aws_iam_policy" "full_access" {
  count = var.policy == null ? 1 : 0

  name   = "${local.naming.iam}KeyFullAccess"
  policy = data.aws_iam_policy_document.full_access.json

  tags = merge(
    local.tags,
    tomap({ "Name" = "${local.naming.display} KMS Full Access Policy" })
  )
}
