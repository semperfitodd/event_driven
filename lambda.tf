data "archive_file" "application" {
  source_content = templatefile("${path.module}/app/app.py", {
    LAMBDA_URL = "UPDATE_THIS" #update this in the lambda to avoid a cycle error in TF
  })

  source_content_filename = "app.py"
  output_path             = "app.zip"
  type                    = "zip"
}

resource "aws_lambda_function" "this" {
  function_name = var.environment

  runtime = "python3.8"
  handler = "app.lambda_handler"

  role = aws_iam_role.lambda_role.arn

  timeout = 300

  environment {
    variables = {
      clickType = ""
    }
  }

  filename         = data.archive_file.application.output_path
  source_code_hash = data.archive_file.application.output_base64sha256

  tags = var.tags
}

resource "aws_lambda_function_url" "this" {
  authorization_type = "NONE"
  function_name      = aws_lambda_function.this.function_name

  cors {
    allow_credentials = false
    allow_origins     = ["*"]
    allow_methods     = ["*"]
  }
}