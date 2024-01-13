# Packer-Hadoop
Build Hadoop AMI using Packer

This is a part of [Hadoop-cluster-setup](https://github.com/haquocdat543/Hadoop-cluster-setup)
# Prerequisites
* [git](https://git-scm.com/downloads)
* [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [config-profile](https://docs.aws.amazon.com/cli/latest/reference/configure/)
* [packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)
## 1. Clone repository
```
git clone https://github.com/haquocdat543/Packer-Hadoop.git
cd Packer-Hadoop
```
## 2. Install packer plugin
```
packer plugins install github.com/hashicorp/amazon
```
## 2. Reconfig
You need to reconfig to your custom in `hadoop.pkr.hcl`
* source-ami-id
* instance_type
* region
* username
* ...
## 4. Start build
```
packer build hadoop.pkr.hcl
```
