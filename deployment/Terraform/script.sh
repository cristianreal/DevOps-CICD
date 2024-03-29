#!/bin/bash
#Declare multiple environment variables
set -e
CIRCLECI_CACHE_DIR="/usr/local/bin"
TERRAFORM_VERSION="1.0.3"
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
#Install terraform
wget -O /tmp/terraform.zip "${TERRAFORM_URL}"
unzip -oud "${CIRCLECI_CACHE_DIR}" /tmp/terraform.zip
terraform version
#Install Kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
#Install HELM
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh