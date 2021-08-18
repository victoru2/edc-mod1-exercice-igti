variable "aws_region" {
  default = "us-east-2"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "451395640202"
}

variable "base_bucket_name" {
  default = "datalake-igti-tf"
}

# Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-igti-victorurquiola"
    key    = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}