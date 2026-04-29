resource "aws_cloudfront_origin_access_control" "feedback_cf_origin_access" {
  name                              = var.feedback_cf_origin_access_name
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
  origin_access_control_origin_type = "s3"
}

resource "aws_cloudfront_distribution" "feedback_cf_distribution" {
  enabled             = "true"
  default_root_object = var.feedback_app_index

  origin {
    domain_name              = aws_s3_bucket.feedback_ui_app_s3.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.feedback_cf_origin_access.id
    origin_id                = var.feedback_cf_origin_id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    viewer_protocol_policy = "allow-all"
    allowed_methods        = ["GET", "HEAD"]
    target_origin_id       = var.feedback_cf_origin_id
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
}
