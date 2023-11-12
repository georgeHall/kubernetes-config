terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.22.0"
    }
  }
}

provider "vault" {
  address = var.addr
  token   = var.token
}
