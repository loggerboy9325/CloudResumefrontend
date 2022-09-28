resource "aws_cloudfront_distribution" "cdn" {

  origin {
    domain_name = aws_s3_bucket.resume.bucket_regional_domain_name
    origin_id = aws_s3_bucket.resume.bucket_regional_domain_name
    s3_origin_config {
        origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  enabled = true
  default_root_object = "index.html"
  aliases = [var.domain_name]
  price_class = "PriceClass_200"
  retain_on_delete = true
  default_cache_behavior {
    allowed_methods = [ "DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id =  aws_s3_bucket.resume.bucket_regional_domain_name
    forwarded_values {
      query_string = true
      headers = []
      cookies {
        forward = "all"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
 viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_route53_record" "websiteurl" {
  name    = var.endpoint
  zone_id = data.aws_route53_zone.domain.zone_id
  type    = "A"

  alias {
     
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = true
  }
}
  


resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.endpoint}"
}


resource "aws_acm_certificate" "cert" {
 
  domain_name               = var.domain_name
  validation_method         = "DNS"
  tags                      = local.tags
}

resource "aws_s3_bucket_policy" "s3policy" {
  bucket = aws_s3_bucket.resume.id
  policy = data.aws_iam_policy_document.s3policy.json
}