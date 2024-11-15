// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ItemExchangeSystem {
    address public platformAdmin;
    uint public constant POINTS_PER_ITEM = 10;
    uint public constant MINIMUM_POINTS_TO_EXCHANGE = 50;
    uint public constant ITEM_VALIDATION_PERIOD = 2 days; // 48 hours in seconds

    struct Item {
        string itemName;
        string itemDetails;
        uint listedTime;
        bool isValidated;
    }

    mapping(address => Item[]) private userItems;
    mapping(address => uint) private userBalances;

    modifier onlyPlatformAdmin() {
        require(msg.sender == platformAdmin, "Only the platform admin can call this function");
        _;
    }

    constructor() {
        platformAdmin = msg.sender;
    }

    // Function to list a new item for exchange
    function listItem(string memory _itemName, string memory _itemDetails) public {
        require(bytes(_itemName).length > 0, "Item name cannot be empty");
        require(bytes(_itemDetails).length > 0, "Item details cannot be empty");

        userItems[msg.sender].push(Item(_itemName, _itemDetails, block.timestamp, false));
    }

    // Function to validate an item and add points if within the validation period
    function validateItem(uint _itemIndex) public {
        require(_itemIndex < userItems[msg.sender].length, "Invalid item index");

        Item storage item = userItems[msg.sender][_itemIndex];
        require(!item.isValidated, "Item has already been validated");

        // Ensure item validation is within the allowed period
        if (block.timestamp <= item.listedTime + ITEM_VALIDATION_PERIOD) {
            item.isValidated = true;
            userBalances[msg.sender] += POINTS_PER_ITEM; // Award points for timely validation
        } else {
            revert("Item validation period has expired");
        }
    }

    // Function to exchange points for benefits
    function exchangePoints(uint _points) public {
        require(userBalances[msg.sender] >= _points, "Insufficient points for exchange");

        uint previousBalance = userBalances[msg.sender];
        userBalances[msg.sender] -= _points;

        // Ensure points were deducted correctly
        assert(userBalances[msg.sender] == previousBalance - _points);
    }

    // Function to view the user's total balance
    function getBalance() public view returns (uint) {
        return userBalances[msg.sender];
    }

    // Retrieve all items listed by the user
    function getUserItems() public view returns (Item[] memory) {
        return userItems[msg.sender];
    }
}
