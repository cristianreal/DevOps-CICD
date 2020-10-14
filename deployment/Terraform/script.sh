#!/bin/bash
#Declare multiple environment variables
set -e
CIRCLECI_CACHE_DIR="/usr/local/bin"
TERRAFORM_VERSION="0.12.28"
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
#Install terraform
wget -O /tmp/terraform.zip "${TERRAFORM_URL}"
unzip -oud "${CIRCLECI_CACHE_DIR}" /tmp/terraform.zip
terraform version
#Install Kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client