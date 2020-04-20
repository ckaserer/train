#!/bin/bash

# build image
docker build -t train --no-cache . 

# disable remote terraform state backend
cat << EOF >terraform/override.tf
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "local" {}
}
EOF

# check terraform version
echo "Terraform Version: "
docker run --rm --entrypoint=/bin/terraform train version

# run terraform validation
docker run --rm -v $(pwd):/mnt/ --entrypoint=/bin/sh train -c "\
  cd /mnt/terraform && \
  terraform init -input=false && \
  terraform validate"

