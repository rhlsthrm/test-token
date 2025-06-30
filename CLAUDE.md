# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Foundry-based Ethereum smart contract project containing:
- **Token.sol**: A basic ERC20-like token implementation (KG/KAVZ token with 1B supply)
- **Counter.sol**: A simple counter contract (likely for testing/examples)
- **Deploy.s.sol**: Deployment script for the Token contract targeting Base network

## Common Commands

### Build and Development
```bash
forge build          # Compile contracts
forge test           # Run all tests
forge test --match-contract CounterTest  # Run specific test contract
forge test --match-test test_Increment   # Run specific test function
forge fmt            # Format Solidity code
forge snapshot       # Generate gas usage snapshots
```

### Local Development
```bash
anvil               # Start local Ethereum node
```

### Deployment
```bash
./deploy.sh         # Deploy Token contract to Base mainnet
# OR manually:
forge script script/Deploy.s.sol --rpc-url https://base.drpc.org --broadcast --verify
```

### Environment Setup
- Copy `.env.example` to `.env` and add your `PRIVATE_KEY`
- The deployment script uses Base network (https://base.drpc.org) by default

## Architecture

### Contract Structure
- **src/**: Main contract implementations
  - `Token.sol`: Basic ERC20 token without OpenZeppelin dependencies
  - `Counter.sol`: Simple state management example
- **script/**: Deployment and interaction scripts
  - `Deploy.s.sol`: Handles Token deployment with private key from environment
- **test/**: Test files using Foundry's testing framework
  - `Counter.t.sol`: Unit tests with fuzz testing examples

### Key Patterns
- Uses Foundry's `forge-std` for testing utilities and script base classes
- Deployment scripts inherit from `Script.sol` and use `vm.startBroadcast()`
- Tests inherit from `Test.sol` and use `setUp()` for initialization
- No external dependencies beyond forge-std (vanilla Solidity implementations)

### Deployment Flow
The project is configured for Base network deployment with verification enabled. The `deploy.sh` script handles environment validation and uses the `Deploy.s.sol` script for actual deployment.