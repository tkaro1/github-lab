terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.19.0"
    }
  }

  backend "local" {
    path = ".state/terraform.tfstate"
  }
}

provider "kubernetes" {
  version     = ">= 0.13"

  load_config_file = module.eks.kubeconfig_filename != "" ? true : false
  config_path      = module.eks.kubeconfig_filename
}
