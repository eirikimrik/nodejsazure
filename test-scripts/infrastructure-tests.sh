#!/bin/bash

# Check if the web app is running
app_state=$(az webapp show --name eirik-app --resource-group eirik.imrik_rg_1308 --query state -o tsv)
if [ "$app_state" != "Running" ]; then
    echo "Web App is not running"
    exit 1
fi

# Check if the container image is correct
container_image=$(az webapp config container show --name eirik-app --resource-group eirik.imrik_rg_1308 --query "properties.image" -o tsv)
if [ "$container_image" != "eirikacr.azurecr.io/eirik-app:latest" ]; then
    echo "Container image mismatch"
    exit 1
fi

echo "Infrastructure tests passed!"
