# Pigeon Clocking System Smart Contract

## Overview

The Pigeon Clocking System smart contract is a decentralized application that allows pigeon owners to register their pigeons and record their arrival times. This contract demonstrates Solidity's capabilities, such as pigeon registration, arrival time recording, and comprehensive error handling using `require()`, `assert()`, and `revert()`.

## Features

- **Pigeon Registration**: Owners can register their pigeons by providing a name.
- **Arrival Time Recording**: Owners can record the arrival time of their registered pigeons.
- **Pigeon Information Retrieval**: Users can retrieve information about registered pigeons.

### Error Handling

- **require()**: Validates user input and conditions (e.g., ensuring the pigeon ID is valid or the caller is the owner).
- **assert()**: Confirms the pigeons count is accurate.
- **revert()**: Used to cancel and revert transactions with a custom error message.

## Getting Started

### Executing Program

Compile the smart contract:

```bash
truffle compile

truffle migrate --network development

truffle console

let contract = await PigeonClockingSystem.deployed();
await contract.registerPigeon("Speedy");
await contract.recordArrivalTime(1); // Record arrival time for pigeon with ID 1
await contract.getPigeon(1); // Retrieve information for pigeon with ID 1

truffle help
```

## Help

### Common Issues
- Ensure MetaMask is connected to the correct Ethereum network.
- Verify sufficient ETH balance for gas fees.

### Helper Command
```bash
truffle help
```

## Authors
Github : @Regie04
FB: Reginald Carl Sanchez

## License
This project is licensed under the MIT License - see the LICENSE file for details.
