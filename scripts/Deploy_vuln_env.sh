#!/bin/bash
# DMP Consulting - Vulnerable Environment Deployment Script

# Variables (Change the suffix to make your storage account name unique)
SUFFIX="dmpgov"
RG_NAME="rg-dmpgov-prod"
LOCATION="eastus"
VNET_NAME="vnet-dmpgov"
NSG_NAME="nsg-dmpgov-frontend"
STORAGE_NAME="dmpgov$SUFFIX"
KV_NAME="kv-dmpgov-$SUFFIX"

echo "Creating Resource Group..."
az group create --name $RG_NAME --location $LOCATION

echo "Creating Virtual Network..."
az network vnet create --resource-group $RG_NAME --name $VNET_NAME --address-prefix 10.0.0.0/16 --subnet-name dmpnet-app --subnet-prefix 10.0.1.0/24

echo "Creating Network Security Group with VULNERABLE rules..."
az network nsg create --resource-group $RG_NAME --name $NSG_NAME
# Intentional Vulnerability: Open SSH and RDP to the Internet
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME --name Allow-SSH-Any --access Allow --protocol Tcp --direction Inbound --priority 100 --source-address-prefix "*" --source-port-range "*" --destination-address-prefix "*" --destination-port-range 22
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME --name Allow-RDP-Any --access Allow --protocol Tcp --direction Inbound --priority 110 --source-address-prefix "*" --source-port-range "*" --destination-address-prefix "*" --destination-port-range 3389

echo "Creating Storage Account with VULNERABLE settings..."
# Intentional Vulnerability: Allow public blob access and disable secure transfer
az storage account create --name $STORAGE_NAME --resource-group $RG_NAME --location $LOCATION --sku Standard_LRS --allow-blob-public-access true --https-only false

echo "Creating Key Vault with VULNERABLE settings..."
# Intentional Vulnerability: Purge protection disabled, public network access enabled
az keyvault create --name $KV_NAME --resource-group $RG_NAME --location $LOCATION --enable-purge-protection false --public-network-access Enabled

echo "Deployment Complete! Target environment is ready for assessment."