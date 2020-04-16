#!/bin/bash

docker build -t train --no-cache . 
cat << EOF >terraform/override.tf
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "local" {}
}
EOF

echo "Terraform Version: "
docker run --rm --entrypoint=/bin/terraform train version

docker run --rm -v $(pwd):/mnt/ --entrypoint=/bin/sh train -c "\
  cd /mnt/terraform && \
  terraform init -input=false && \
  terraform validate"