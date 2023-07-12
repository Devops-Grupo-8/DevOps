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

variable "vpc_id" {
  description = "VPC Identification"
  type = string
  default = "vpc-04229af4a6a672170"
}

variable "subnets" {
    description = "Subnets"
    type = list(string)
    default = [
      "subnet-00b01135e0b2ead8a",//us-east-1a
      "subnet-0b622820bf7b3cbd3",//us-east-1b
      "subnet-0094ce9554cbddc1f",//us-east-1c
      "subnet-00c685b3f5b29815b",//us-east-1d
      "subnet-0287682052ec06fe0"//us-east-1f
    ]
}

variable "role_arn" {
  description = "Role ARN"
  type = string
  default = "arn:aws:iam::045017788685:role/LabRole" 
}