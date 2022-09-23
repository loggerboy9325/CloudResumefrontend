resource "aws_s3_bucket" "resume" {
  bucket = var.bucket

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}



resource "aws_s3_object" "index" {
  bucket = var.bucket
  key    = "index.html"
  source = "index.html"
 


}

resource "aws_s3_object" "script" {
  bucket = var.bucket
  key    = "script.js"
  source = "script.js"
  

}

resource "aws_s3_object" "ccp" {
  bucket = var.bucket
  key    = "ccp.png"
  source = "images/CCP.png"
 

 
}

    resource "aws_s3_object" "portrait" {
  bucket = var.bucket
  key    = "portrait"
  source = "images/portrait.jpg"
 }


    resource "aws_s3_object" "error" {
  bucket = var.bucket
  key    = "404.html"
  source = "404.html"
    }

      resource "aws_s3_object" "ssa" {
  bucket = var.bucket
  key    = "ssa"
  source = "images/SAA.png"
     }

 resource "aws_s3_object" "sap" {
  bucket = var.bucket
  key    = "SAP"
  source = "images/SAP.png"
 }


resource "aws_s3_bucket_website_configuration" "websiteconfig" {
  bucket = aws_s3_bucket.var.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}