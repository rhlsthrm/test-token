#!/bin/bash

# Array of token names
declare -a names=("Uno" "Dos" "Tres" "Cuatro" "Cinco")
declare -a symbols=("UNO" "DOS" "TRES" "CUATRO" "CINCO")

# Load environment variables
source .env

# Deploy each token
for i in ${!names[@]}; do
    echo "================================================"
    echo "Deploying token ${names[$i]} (${symbols[$i]})"
    echo "================================================"
    
    # Update TOKEN_NAME and TOKEN_SYMBOL environment variables for this run
    export TOKEN_NAME="${names[$i]}"
    export TOKEN_SYMBOL="${symbols[$i]}"
    
    # Deploy without verification to speed up process
    forge script script/Deploy.s.sol --rpc-url "$RPC_URL" --broadcast --slow
    
    echo "Token ${names[$i]} deployment submitted!"
    echo ""
done

echo "================================================"
echo "All token deployments submitted!"
echo "================================================"