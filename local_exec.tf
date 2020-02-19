terraform {
  backend "local" {
    path = "/tmp/terraform/workspace/terraform.tfstate"
  }

}

provider "aws" {
  region = "${aws_region}"
  }

resource "aws_instance" "backend" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.vm_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]
  

}
resource "null_resource" "remote-exec-1" {
    connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    host        = "${aws_instance.backend.public_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install python sshpass -y",
    ]
  }
}
resource "null_resource" "ansible-main" {
provisioner "local-exec" {
  command = <<EOT
        sleep 50;
        > jenkins-ci.ini;
        echo "[jenkins-ci]"| tee -a jenkins-ci.ini;
        export ANSIBLE_HOST_KEY_CHECKING=False;
        echo "${aws_instance.backend.public_ip}" | tee -a jenkins-ci.ini;
    EOT
}
}
