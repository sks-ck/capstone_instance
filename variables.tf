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
  default = "ami-0620d12a9cf777c87"
}
variable "instance_count" {
  default = "2"
}
