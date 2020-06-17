#!/usr/bin/env bash

resource_group=linuxResourceGroup
uid=$(date +'m%md%dy%y')
storageAccount=storageacc${uid}
location=eastus
whoami=$(whoami)

# Create resource group
az group create --name ${resource_group} --location ${location}

# create storage account
az storage account create -n ${storageAccount} -g ${resource_group} -l ${location}

# list resource groups
az group list --output table

# list vm images
az vm image list --publisher OpenLogic --offer CentOS --output table

# list available VM sizes
az vm list-sizes --location ${location} --output table

# Create a virtual machine
az vm create --resource-group ${resource_group} --name ${whoami}LinuxVM --image OpenLogic:CentOS:7.5:latest \
  --size Standard_AO  --admin-username ec2-user --generate-ssh-keys

az vm list-ip-addresses --name ${whoami}LinuxVM --resource-group ${resource_group} --output table


