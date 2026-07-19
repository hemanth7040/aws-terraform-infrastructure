terraform {

  backend "s3" {

    bucket = "terraform-state-hemanth6010"
    key    = "dev/terraform.tfstate"
    region = "ap-south-2"

    dynamodb_table = "terraform-locks"

    encrypt = true

  }

}