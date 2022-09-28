resource "aws_s3_bucket" "resume" {
  bucket = var.bucket
 

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_public_access_block" "s3block" {
  bucket                  = aws_s3_bucket.resume.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_acl" "bucketacl" {
  bucket = aws_s3_bucket.resume.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "websiteconfig" {
  bucket = var.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }

  
    }
  




resource "aws_s3_object" "index" {
  bucket = var.bucket
  key    = "index.html"
  source = "index.html"
   content_type = "text/html"
 
 depends_on = [
   var.bucket
 ]

}

resource "aws_s3_object" "script" {
  bucket = var.bucket
  key    = "script.js"
  source = "script.js"
   depends_on = [
   var.bucket
 ]

}

resource "aws_s3_object" "ccp" {
  bucket = var.bucket
  key    = "images/CCP.png"
  source = "images/CCP.png"
 
 depends_on = [
   var.bucket
 ]
 
}

    resource "aws_s3_object" "portrait" {
  bucket = var.bucket
  key    = "images/portrait.jpg"
  source = "images/portrait.jpg"

   depends_on = [
   var.bucket
 ]
 }


    resource "aws_s3_object" "error" {
  bucket = var.bucket
  key    = "404.html"
  source = "404.html"
  content_type = "text/html"

   depends_on = [
   var.bucket
 ]
    }

      resource "aws_s3_object" "ssa" {
  bucket = var.bucket
  key    = "images/SAA.png"
  source = "images/SAA.png"
   depends_on = [
   var.bucket
 ]
     }

 resource "aws_s3_object" "sap" {
  bucket = var.bucket
  key    = "images/SAP.png"
  source = "images/SAP.png"
   depends_on = [
   var.bucket
 ]
 }


