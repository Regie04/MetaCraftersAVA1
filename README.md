# Item Exchange System Smart Contract

## Overview

The Item Exchange System smart contract is a decentralized application that allows users to list items, validate them within a set timeframe, and accumulate points for successful validations. Users can later redeem their accumulated points. This contract demonstrates Solidity's capabilities, such as item listing, validation within a deadline, and comprehensive error handling using `require()`, `assert()`, and `revert()`.

## Features

- **Item Listing**: Users can list new items by providing an item name and description.
- **Validation**: Users can validate items within a specific time period to earn points.
- **Point Redemption**: Users can redeem their accumulated points when they meet or exceed the specified redemption threshold.

### Error Handling

- **require()**: Validates user input and conditions (e.g., ensuring an item exists or the user has enough points to redeem).
- **assert()**: Confirms the points balance is accurate after redemption.
- **revert()**: Used to cancel and revert transactions if validation conditions are not met within the allowed timeframe.

## Getting Started

### Installing

Clone the repository or download the smart contract file.

Ensure your development environment includes:

- Node.js
- Truffle
- Ganache
- MetaMask

Navigate to your project directory using the terminal.

### Executing Program

Compile the smart contract:

```bash
truffle compile

truffle migrate --network development

truffle console

let contract = await ItemExchangeSystem.deployed();
await contract.listItem("Antique Vase", "A rare ceramic vase from the 18th century");
await contract.validateItem(0); // Validate item at index 0
await contract.redeemPoints(50); // Redeem 50 points


truffle help
