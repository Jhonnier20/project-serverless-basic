region_main = "us-east-1"
admin_email = "jhonnier2020@gmail.com"

feedback_table_name         = "feedback-jhonnier"
billing_mode_feedback_table = "PAY_PER_REQUEST"
hash_key_feedback_table     = "feedback_id"

feedback_pdf_s3_name    = "feedback-pdf-jhonnier-tf"
feedback_ui_app_s3_name = "feedback-ui-app-jhonnier-tf"
feedback_app_index      = "index.html"

submit_feedback_function_name    = "SubmitFeedbackFunction"
runtime_function                 = "python3.13"
role_feedback_function_name      = "submit_feedback_function_role"
submit_feedback_function_handler = "submit_feedback.handler"

feedback_api_name     = "FeedbackAPI"
feedback_api_endpoint = ["REGIONAL"]
feedback_api_path     = "submit"
feedback_api_stage    = "prod"

feedback_cf_origin_access_name = "feedback-ui-cf-access"
feedback_cf_origin_id          = "feedback-ui-cf-origin"
