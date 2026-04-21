#!/bin/bash
echo ""
echo "==> Initialisation..."
terraform init -var-file=terraform.tfvars

echo "==> validate..."
terraform validate .

echo "==> Apply..."
terraform apply -auto-approve -var-file=./common.tfvars -var-file=build.tfvars

echo ""
echo "==> Déployé !"
