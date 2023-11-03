provider "aws" {
    region = var.aws_region
    access_key = var.aws_access
    secret_key = var.aws_secret
}

resource "aws_iam_group" "admin_group" {
  name = "wjdc-admin-group"
}

resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_group_membership" "admin_user_membership" {
  user = "wayne"
  groups = [aws_iam_group.admin_group.name]
}
