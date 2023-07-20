resource "aws_eks_cluster" "cluster-dev" {
  name     = "devops-grupo-8-dev"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnets
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_eks_cluster" "cluster-test" {
  name     = "devops-grupo-8-test"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnets
  }

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}

resource "aws_eks_cluster" "cluster-prod" {
  name     = "devops-grupo-8-prod"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnets
  }

  tags = {
    Environment = "prod"
    Terraform   = "true"
  }
}

//buckets
resource "aws_s3_bucket" "bucket_dev" {
  bucket  = "devops-grupo-8-bucket-dev"
  tags = {
    Name        = "devops-grupo-8-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "bucket_test" {
  bucket  = "devops-grupo-8-bucket-test"
  tags = {
    Name        = "devops-grupo-8-bucket"
    Environment = "test"
  }
}

resource "aws_s3_bucket" "bucket_prod" {
  bucket  = "devops-grupo-8-bucket-prod"
  tags = {
    Name        = "devops-grupo-8-bucket"
    Environment = "prod"
  }
}

//allow-public-acces
resource "aws_s3_bucket_public_access_block" "public_acces_bucket_dev" {
  bucket = aws_s3_bucket.bucket_dev.id

  block_public_acls       = false
  block_public_policy     = false
}

resource "aws_s3_bucket_public_access_block" "public_acces_bucket_test" {
  bucket = aws_s3_bucket.bucket_test.id

  block_public_acls       = false
  block_public_policy     = false
}

resource "aws_s3_bucket_public_access_block" "public_acces_bucket_prod" {
  bucket = aws_s3_bucket.bucket_prod.id

  block_public_acls       = false
  block_public_policy     = false
}

//allow-acces
resource "aws_s3_bucket_policy" "allow_acces_bucket_test" {
  bucket = aws_s3_bucket.bucket_test.id
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": "GetObjectFromS3",
    "Statement": [
      {
        "Sid": "1",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::testops-grupo-8-bucket-test/*"
      }
    ]
  }
  EOF
}

resource "aws_s3_bucket_policy" "allow_acces_bucket_prod" {
  bucket = aws_s3_bucket.bucket_prod.id
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": "GetObjectFromS3",
    "Statement": [
      {
        "Sid": "1",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::devops-grupo-8-bucket-prod/*"
      }
    ]
  }
  EOF
}

resource "aws_s3_bucket_policy" "allow_acces_bucket_dev" {
  bucket = aws_s3_bucket.bucket_dev.id
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": "GetObjectFromS3",
    "Statement": [
      {
        "Sid": "1",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::devops-grupo-8-bucket-dev/*"
      }
    ]
  }
  EOF
}

//website-configuration
resource "aws_s3_bucket_website_configuration" "website_bucket_dev" {
  bucket = aws_s3_bucket.bucket_dev.id
  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_website_configuration" "website_bucket_test" {
  bucket = aws_s3_bucket.bucket_test.id
  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_website_configuration" "website_bucket_prod" {
  bucket = aws_s3_bucket.bucket_prod.id
  index_document {
    suffix = "index.html"
  }
}

//Repositorios
resource "aws_ecr_repository" "orders-service-example" {
  name                 = "orders-service-example"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "shipping-service-example" {
  name                 = "shipping-service-example"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "payments-service-example" {
  name                 = "payments-service-example"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "products-service-example" {
  name                 = "products-service-example"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "webapp" {
  name                 = "webapp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}