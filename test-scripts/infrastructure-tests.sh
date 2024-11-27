#!/bin/bash

# Set environment variables
RESOURCE_GROUP="eirik.imrik_rg_1308"
WEB_APP_NAME="eirik-app"
EXPECTED_IMAGE="eirikacr.azurecr.io/eirik-app:latest"

# Check if the web app exists
if ! az webapp show --name $WEB_APP_NAME --resource-group $RESOURCE_GROUP &>/dev/null; then
    echo "Error: Web App $WEB_APP_NAME does not exist in Resource Group $RESOURCE_GROUP"
    exit 1
fi

# Check if the web app is running
app_state=$(az webapp show --name $WEB_APP_NAME --resource-group $RESOURCE_GROUP --query state -o tsv)
if [ "$app_state" != "Running" ]; then
    echo "Error: Web App $WEB_APP_NAME is not running. Current state: $app_state"
    exit 1
fi

# Check if the correct container image is configured
container_image=$(az webapp config container show --name $WEB_APP_NAME --resource-group $RESOURCE_GROUP --query "properties.image" -o tsv)

if [ -z "$container_image" ]; then
    echo "Error: Container image is not configured in Web App $WEB_APP_NAME"
    exit 1
fi

if [ "$container_image" != "$EXPECTED_IMAGE" ]; then
    echo "Error: Expected container image is $EXPECTED_IMAGE but found $container_image"
    exit 1
fi

echo "Infrastructure tests passed successfully!"
