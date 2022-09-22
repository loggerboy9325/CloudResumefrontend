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

