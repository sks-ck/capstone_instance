variable "key_name" {
  default = "keypair1"
}

variable "pvt_key" {
  default = "/root/.ssh/mykey.pem"
}

variable "sg-id" {
  default = "sg-0154e36a86dd411b2"
}

variable "ami-id" {
  default = "ami-0620d12a9cf777c87"
}
