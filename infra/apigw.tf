resource "aws_api_gateway_rest_api" "feedback_rest_api" {
  name = var.feedback_api_name
  endpoint_configuration {
    types = var.feedback_api_endpoint
  }
}

resource "aws_api_gateway_resource" "feedback_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.feedback_rest_api.id
  parent_id   = aws_api_gateway_rest_api.feedback_rest_api.root_resource_id
  path_part   = var.feedback_api_path
}

# POST method
resource "aws_api_gateway_method" "feedback_api_post" {
  rest_api_id   = aws_api_gateway_rest_api.feedback_rest_api.id
  resource_id   = aws_api_gateway_resource.feedback_api_resource.id
  authorization = "NONE"
  http_method   = "POST"
}

# OPTIONS method para CORS
resource "aws_api_gateway_method" "feedback_api_options" {
  rest_api_id   = aws_api_gateway_rest_api.feedback_rest_api.id
  resource_id   = aws_api_gateway_resource.feedback_api_resource.id
  authorization = "NONE"
  http_method   = "OPTIONS"
}

resource "aws_api_gateway_integration" "feedback_api_integration_function" {
  rest_api_id             = aws_api_gateway_rest_api.feedback_rest_api.id
  resource_id             = aws_api_gateway_resource.feedback_api_resource.id
  http_method             = aws_api_gateway_method.feedback_api_post.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.submit_feedback_function.invoke_arn
}

resource "aws_api_gateway_deployment" "feedback_api_deploy" {
  rest_api_id = aws_api_gateway_rest_api.feedback_rest_api.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.feedback_api_resource.id,
      aws_api_gateway_method.feedback_api_post.id,
      aws_api_gateway_integration.feedback_api_integration_function.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "feedback_api_stage" {
  deployment_id = aws_api_gateway_deployment.feedback_api_deploy.id
  rest_api_id   = aws_api_gateway_rest_api.feedback_rest_api.id
  stage_name    = var.feedback_api_stage
}
