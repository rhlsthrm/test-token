// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address recipient = vm.envAddress("RECIPIENT");
        string memory tokenName = vm.envString("TOKEN_NAME");
        string memory tokenSymbol = vm.envString("TOKEN_SYMBOL");

        vm.startBroadcast(deployerPrivateKey);

        Token token = new Token(tokenName, tokenSymbol);

        // Transfer all tokens to the recipient
        uint256 totalSupply = token.totalSupply();
        token.transfer(recipient, totalSupply);

        vm.stopBroadcast();
    }
}