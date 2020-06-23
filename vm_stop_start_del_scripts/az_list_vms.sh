#!/bin/bash

# This command lists all the VM's in a resource group. This command takes one input, the resource group. 

RG=$1

az vm list --resource-group $RG --output tsv --query "[].{name:name}"
