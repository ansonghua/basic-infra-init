
/* add Lambda **/

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "user-management-api/index.js"
  output_path = "user-management-api-${var.env}.zip"
}

resource "aws_lambda_function" "user-management-api-lambda" {
  filename         = "user-management-api-${var.env}.zip"
  function_name    = "ccs-asap-user-management-api-${var.env}"
  role             = "arn:aws:iam::237849564662:role/lambda_basic_exec_role"
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "nodejs12.x"
  environment {
    variables = {
      env = var.env
    }
  }
}

resource "aws_cloudwatch_log_group" "user-management-api-lambda" {
  name = "/aws/lambda/${aws_lambda_function.user-management-api-lambda.function_name}"

  retention_in_days = 30
}

# data "aws_iam_role" "lambda_exec" {
#   name = "serverless_lambda"
# }
# resource "aws_iam_role" "lambda_exec" {
#   name = "serverless_lambda"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Sid    = ""
#       Principal = {
#         Service = "lambda.amazonaws.com"
#       }
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "lambda_policy" {
#   role       = aws_iam_role.lambda_exec.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }