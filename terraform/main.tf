provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" var.bucket_name {
  bucket = var.bucket_name
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "sbcardgame_policy" {
  bucket = aws_s3_bucket.sbcardgame.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${arn:aws:s3:::sbcardgame}/*"
      }
    ]
  })
}