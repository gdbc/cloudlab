#!/bin/bash

# This command starts a VM. This command takes one input, the VM name which you can get from az_list_vms.sh. The resource group RG is hardcoded, change if required.

VM=$1
RG="rancher-training-rg"

az vm start --resource-group $RG --name $VM
