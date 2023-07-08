data "aws_secretsmanager_secret" "by-arn" {
  arn = var.secret_arn
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.by-arn.id
}