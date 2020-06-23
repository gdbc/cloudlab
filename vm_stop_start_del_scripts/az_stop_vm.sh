#!/bin/bash

# This script stops a VM. It takes one input, the VM name which you can get from az_list_vms.sh. The resource group RG is hardcoded.

VM=$1
RG="rancher-training-rg"

az vm stop --resource-group $RG --name $VM 
az vm deallocate --resource-group $RG --name $VM
