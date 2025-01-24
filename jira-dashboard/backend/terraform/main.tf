provider "aws" {
  region = "us-east-1"
}

# DynamoDB Table
resource "aws_dynamodb_table" "issues" {
  name         = "JiraIssues"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "IssueID"

  attribute {
    name = "IssueID"
    type = "S"
  }
}

# Lambda: Fetch Issues
resource "aws_lambda_function" "fetch_issues" {
  filename      = "fetch_issues.zip"
  function_name = "fetch_issues"
  role          = aws_iam_role.lambda_role.arn
  handler       = "app.lambda_handler"
  runtime       = "python3.9"
  environment {
    variables = {
      ISSUES_TABLE = aws_dynamodb_table.issues.name
      JIRA_URL     = "https://YOUR_COMPANY.atlassian.net/rest/api/3/search"
      JIRA_TOKEN   = var.jira_token
    }
  }
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}
