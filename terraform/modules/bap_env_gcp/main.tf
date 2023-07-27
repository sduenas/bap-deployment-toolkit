terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}


locals {
    machine_image = "${var.os_image_family}-cloud/${var.os_image_family}-${var.os_image_version}"
}