#!/bin/bash

# Load environment variables from .env file
source .env

# Check if PRIVATE_KEY is set
if [ -z "$PRIVATE_KEY" ]; then
    echo "Error: PRIVATE_KEY not found in .env file"
    echo "Please copy .env.example to .env and add your private key"
    exit 1
fi

# Check if RECIPIENT is set
if [ -z "$RECIPIENT" ]; then
    echo "Error: RECIPIENT not found in .env file"
    echo "Please add RECIPIENT=<address> to your .env file"
    exit 1
fi

RPC_URL="${RPC_URL:-https://base.drpc.org}"

echo "Deploying Token contract..."
echo "RPC URL: $RPC_URL"
echo "Recipient: $RECIPIENT"

# Run the deployment script
forge script script/Deploy.s.sol --rpc-url "$RPC_URL" --broadcast --verify --slow

echo "Deployment complete!"