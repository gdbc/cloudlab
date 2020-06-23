#!/bin/bash

# This script allows you to delete a VM. This script takes one input, the vm name which you can get from az_list_vms.sh. The resource group RG is hardcoded, change if required.

VM=$1
RG="rancher-training-rg"

az vm delete --resource-group $RG --name $VM -y &
