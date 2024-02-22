variable "release_version" {
  default = "5.53.12"
}

variable "chart" {
  default = "argo-cd"
}

variable "repository" {
  default = "https://argoproj.github.io/argo-helm"
}

variable "helm_release_name" {
  default = "argocd"
}

variable "namespace_name" {
  default = "argocd_namespace"
}