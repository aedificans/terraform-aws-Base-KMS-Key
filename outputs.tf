output "arn" {
  value       = aws_kms_key.this.arn
  description = "The ARN of the KMS Key"
}

output "id" {
  value       = aws_kms_key.this.id
  description = "The ID of the KMS Key"
}

output "alias" {
  value       = aws_kms_alias.this.name
  description = "The KMS Alias for the KMS Key"
}

output "encrypt_policy_arn" {
  value       = var.policy == null ? aws_iam_policy.encrypt[0].arn : null
  description = "The ARN of a policy that allows encryption access to the KMS Key"
}

output "decrypt_policy_arn" {
  value       = var.policy == null ? aws_iam_policy.decrypt[0].arn : null
  description = "The ARN of a policy that allows decryption access to the KMS Key"
}

output "bicrypt_policy_arn" {
  value       = var.policy == null ? aws_iam_policy.bicrypt[0].arn : null
  description = "The ARN of a policy that allows encryption and decryption access to the KMS Key"
}

output "full_access_policy_arn" {
  value       = var.policy == null ? aws_iam_policy.full_access[0].arn : null
  description = "The ARN of a policy that allows full access to the KMS Key"
}
