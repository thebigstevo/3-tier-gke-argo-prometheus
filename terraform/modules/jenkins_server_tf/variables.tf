variable "project_id" {

}

variable "region" {
 default = "us-west4"
}

variable "zone" {
default = "us-west4-a"
} 

variable "image" {
default = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable ip_cidr_range{
 default =  "10.0.3.0/24"
}
