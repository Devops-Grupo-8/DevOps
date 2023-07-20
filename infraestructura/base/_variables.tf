# Input Variables

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "cluster_name" {
  description = "Nombre del Cluster"
  type = string
}

variable "enviroment_name" {
  description = "Nombre de Ambiente"
  type = string
}

variable "bucket_name" {
  description = "Nombre del Bucket"
  type = string
}

variable "bucket_tag_name" {
  description = "Tag del bucket"
  type = string
}

variable "vpc_id" {
  description = "VPC Identification"
  type = string
  default = "vpc-0b93076cd810031da"
}

variable "subnets" {
    description = "Subnets"
    type = list(string)
    default = [
      "subnet-063115524eb96204d",//us-east-1a
      "subnet-0b6ce9e49b6dbff5f",//us-east-1b
      "subnet-08327091bee32e60e",//us-east-1c
      "subnet-0923aa813f6bc08ea",//us-east-1d
      "subnet-0341dea98868d7e8b"//us-east-1f
    ]
}

variable "role_arn" {
  description = "Role ARN"
  type = string
  default = "arn:aws:iam::346054926618:role/LabRole" 
}