#!/bin/bash

# Array of token names
declare -a names=("Uno" "Dos" "Tres" "Cuatro" "Cinco")
declare -a symbols=("UNO" "DOS" "TRES" "CUATRO" "CINCO")

# Load environment variables
source .env

# Save original values
ORIGINAL_NAME=$TOKEN_NAME
ORIGINAL_SYMBOL=$TOKEN_SYMBOL

# Deploy each token
for i in ${!names[@]}; do
    echo "================================================"
    echo "Deploying token ${names[$i]} (${symbols[$i]})"
    echo "================================================"
    
    # Update .env file
    sed -i '' "s/TOKEN_NAME=.*/TOKEN_NAME=\"${names[$i]}\"/" .env
    sed -i '' "s/TOKEN_SYMBOL=.*/TOKEN_SYMBOL=\"${symbols[$i]}\"/" .env
    
    # Deploy
    ./deploy.sh
    
    # Wait between deployments to avoid rate limits
    if [ $i -lt $((${#names[@]} - 1)) ]; then
        echo "Waiting 10 seconds before next deployment..."
        sleep 10
    fi
done

# Restore original values
sed -i '' "s/TOKEN_NAME=.*/TOKEN_NAME=\"$ORIGINAL_NAME\"/" .env
sed -i '' "s/TOKEN_SYMBOL=.*/TOKEN_SYMBOL=\"$ORIGINAL_SYMBOL\"/" .env

echo "================================================"
echo "All tokens deployed successfully!"
echo "================================================"