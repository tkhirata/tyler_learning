resource "aws_secretsmanager_secret" "LLLB_Secrets" {
  name    = "LoL_Leaderboard_Secrets"
  description = "Storage for API Keys for Leaderboard"
}