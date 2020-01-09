#!/usr/bin/env sh

set -e
# Set tools desired versions
AWS_CLI_VERSION=1.16.273
TERRAFORM_VERSION=0.12.8

# Build the Debian based image:
docker image build -f debian.Dockerfile \
    -t travissouth/terraform-aws-cli:debian-${TERRAFORM_VERSION}-${AWS_CLI_VERSION} \
    -t travissouth/terraform-aws-cli:debian-latest \
    .

# Build the Alpine based image:
docker image build -f alpine.Dockerfile \
    -t travissouth/terraform-aws-cli:alpine-${TERRAFORM_VERSION}-${AWS_CLI_VERSION} \
    -t travissouth/terraform-aws-cli:alpine-latest \
    .

docker push travissouth/terraform-aws-cli:debian-latest
docker push travissouth/terraform-aws-cli:debian-${TERRAFORM_VERSION}-${AWS_CLI_VERSION}
docker push travissouth/terraform-aws-cli:alpine-latest
docker push travissouth/terraform-aws-cli:alpine-${TERRAFORM_VERSION}-${AWS_CLI_VERSION}
