data "aws_iam_policy_document" "encrypt" {
  statement {
    sid = "EncryptionAccess"
    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:GenerateDataKey*",
      "kms:ReEncrypt*",
    ]
    resources = [aws_kms_key.this.arn]
  }
}
data "aws_iam_policy_document" "decrypt" {
  statement {
    sid       = "DecryptionAccess"
    actions   = ["kms:Decrypt"]
    resources = [aws_kms_key.this.arn]
  }
}
data "aws_iam_policy_document" "bicrypt" {
  statement {
    sid = "BicryptionAccess"
    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:GenerateDataKey*",
      "kms:GenerateRandom",
      "kms:GetKeyPolicy",
      "kms:ListAliases",
      "kms:ReEncrypt*",
    ]
    resources = [aws_kms_key.this.arn]
  }
}
data "aws_iam_policy_document" "full_access" {
  statement {
    sid       = "FullAccess"
    actions   = ["kms:*"]
    resources = [aws_kms_key.this.arn]
  }
}
