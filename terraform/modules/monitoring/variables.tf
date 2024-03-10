variable "helm_release_name" {
  default = "prometheus-stack"
}

variable "release_version" {
  default = "56.8.2"
}

variable "chart" {
  default = "kube-prometheus-stack"
}

variable "repository" {
  default = "https://prometheus-community.github.io/helm-charts"
}

variable "namespace_name" {
  default = "monitoring"
}