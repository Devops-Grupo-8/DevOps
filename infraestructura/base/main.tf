/*
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.21"

  cluster_name    = var.cluster_name
  cluster_version = "1.26"

  cluster_endpoint_public_access = true

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnets
  control_plane_subnet_ids = var.subnets

  create_iam_role = false
  iam_role_arn    = var.role_arn

  eks_managed_node_group_defaults = {
    instance_types = ["t3.micro"]
  }

  eks_managed_node_groups = {
    workers = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types           = ["t3.small"]
      capacity_type            = "ON_DEMAND"
      iam_role_arn             = var.role_arn
      iam_instance_profile_arn = var.role_arn
      create_iam_role          = false
      create_role              = false
    }
  }

  tags = {
    Environment = var.enviroment_name
    Terraform   = "true"
  }
}*/

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.9.0"
  bucket  = var.bucket_name
  acl = "private"
}

resource "aws_s3_bucket_policy" "allow_acces" {
  bucket = module.s3_bucket.s3_bucket_id
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
        "Resource": "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  }
  EOF
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = module.s3_bucket.s3_bucket_id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_acces" {
  bucket = module.s3_bucket.s3_bucket_id

  block_public_acls       = false
  block_public_policy     = false
}

resource "aws_ecr_repository" "foo" {
  name                 = var.bucket_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}