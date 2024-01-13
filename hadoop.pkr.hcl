variable "ami_id" {
  type    = string
  default = "ami-07c589821f2b353aa"
}

locals {
    app_name = "hadoopUbuntu"
}

source "amazon-ebs" "hadoopUbuntu" {
  ami_name      = "${local.app_name}"
  instance_type = "t3.medium"
  region        = "ap-northeast-1"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ubuntu"
  tags = {
    Env  = "DEV"
    Name = "${local.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.hadoopUbuntu"]

  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}

