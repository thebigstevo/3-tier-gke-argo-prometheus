variable "region" {
  default = "us-west4"
}

variable "zone" {
  default = "us-west4-a"
}


variable "subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "machine_type" {
  default = "e2-medium"
}

variable "disk_size_gb" {
  default = 10
}

variable "node_count" {
  default = 1
}

variable "cluster_name" {
  default = "three-tier-cluster"
}