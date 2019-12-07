output "password" {
  value = aws_iam_user_login_profile.user.*.encrypted_password
}
