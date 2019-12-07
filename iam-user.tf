resource "aws_iam_user" "user" {
  count = length(var.usernames)
  name  = element(var.usernames, count.index)
  path  = "/"
}

resource "aws_iam_user_login_profile" "user" {
  count   = length(var.usernames)
  user    = element(aws_iam_user.user.*.name, count.index)
  pgp_key = file(var.pgp_key)
}

resource "aws_iam_user_policy_attachment" "administrator-attach" {
  count      = length(var.usernames)
  user       = element(aws_iam_user.user.*.name, count.index)
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
