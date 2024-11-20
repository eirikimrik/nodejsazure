#!/bin/bash
# Check Web App status

RESOURCE_GROUP="eirik.imrik_rg_1308"
WEB_APP_NAME="eirik-app"

# Fetch the web app state
app_state=$(az webapp show --resource-group "$RESOURCE_GROUP" --name "$WEB_APP_NAME" --query state -o tsv)

# Validate the state
if [ "$app_state" != "Running" ]; then
    echo "Web App is not running"
    exit 1
fi

echo "Web App is running successfully"
