variable "ami_id" {
  type    = string
  default = "ami-0dfa284c9d7b2adad"
}

locals {
    app_name = "hadoop"
}

source "amazon-ebs" "hadoop" {
  ami_name      = "${local.app_name}"
  instance_type = "t3.medium"
  region        = "ap-northeast-1"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ec2-user"
  tags = {
    Env  = "DEV"
    Name = "${local.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.hadoop"]

  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}

