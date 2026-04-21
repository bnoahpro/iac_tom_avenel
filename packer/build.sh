#!/bin/bash

echo ""
echo "==> Initialisation des plugins..."
packer init .

echo "==> Validation du template..."
packer validate \
  -var-file ./common.pkrvars.hcl \
  -var-file ./rocky/9/rocky9.pkrvars.hcl \
  .

echo "==> Build en cours..."
packer build \
  -var-file ./common.pkrvars.hcl \
  -var-file ./rocky/9/rocky9.pkrvars.hcl \
  .

echo "==> Build terminé !"
