variable "project_id" {

}

variable "region" {
 default = "us-west4"
}

variable "zone" {
default = "us-west4-a"
} 

variable "image" {
default = "ubuntu-os-cloud/ubuntu-2204-jammy-arm64-v20240228"
}

variable ip_cidr_range{
 default =  "10.0.3.0/24"
}
