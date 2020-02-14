variable "key_name" {
  default = "keypair1"
}

variable "pvt_key" {
  default = "/root/.ssh/mykey.pem"
}

variable "sg-id" {
  default = "sg-0fdd650ca717f16fa"
}

variable "ami_id" {
  default = "ami-05695932c5299858a"
}
