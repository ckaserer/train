#!/bin/bash

# fail and exit
set -ex

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
echo "Terraform Version: "; docker run --rm --entrypoint=/bin/terraform ${CONTAINER_IMAGE_NAME} version

# run terraform validation
docker run --rm -v $(pwd):/mnt/ --entrypoint=/bin/sh ${CONTAINER_IMAGE_NAME} -c "\
  cd /mnt/terraform && \
  terraform init -input=false && \
  terraform validate"

set +ex