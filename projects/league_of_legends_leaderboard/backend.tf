terraform {
  backend "s3" {
    bucket         = "league-of-legends-leaderboard-terraform-state"
    key            = "terraform.state"
    dynamodb_table = "league-of-legends-leaderboard-tf-locks"
    region         = "us-west-2"
    encrypt        = true
  }
}
