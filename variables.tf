variable "key_name" {
  default = "keypair1"
}

variable "pvt_key" {
  default = "/root/.ssh/mykey.pem"
}

variable "sg-id" {
  default = "sg-0e942c4946a3b5a81"
}

variable "ami_id" {
  default = "ami-0fc20dd1da406780b"
}
