resource "aws_s3_bucket" "web_hosting_bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "bucket_config" {
    bucket = aws_s3_bucket.web_hosting_bucket.bucket
    index_document {
        suffix = "index.html"
    }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.web_hosting_bucket.arn,
          "${aws_s3_bucket.web_hosting_bucket.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_object" "example-index" {
    bucket = aws_s3_bucket.web_hosting_bucket.id
    key    = "index.html"
    source = "static-files/index.html"
    acl    = "public-read"
    content_type = "text/html"
}

