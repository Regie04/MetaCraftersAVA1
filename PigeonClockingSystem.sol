// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PigeonClockingSystem {
    struct Pigeon {
        uint id;
        string name;
        address owner;
        uint arrivalTime;
    }

    mapping(uint => Pigeon) public pigeons;
    mapping(address => bool) public registeredOwners;
    uint public pigeonsCount;

    event PigeonRegistered(uint indexed pigeonId, string name, address indexed owner);
    event ArrivalTimeRecorded(uint indexed pigeonId, uint arrivalTime);

    function registerPigeon(string memory name) public {
        require(!registeredOwners[msg.sender], "Owner already registered a pigeon");

        pigeonsCount++;
        pigeons[pigeonsCount] = Pigeon(pigeonsCount, name, msg.sender, 0);
        registeredOwners[msg.sender] = true;

        emit PigeonRegistered(pigeonsCount, name, msg.sender);
    }

    function recordArrivalTime(uint pigeonId) public {
        require(pigeonId > 0 && pigeonId <= pigeonsCount, "Invalid pigeon ID");
        Pigeon storage pigeon = pigeons[pigeonId];
        require(pigeon.owner == msg.sender, "Only the owner can record arrival time");
        require(pigeon.arrivalTime == 0, "Arrival time already recorded");

        pigeon.arrivalTime = block.timestamp;

        emit ArrivalTimeRecorded(pigeonId, pigeon.arrivalTime);
    }

    function getPigeon(uint pigeonId) public view returns (string memory name, address owner, uint arrivalTime) {
        require(pigeonId > 0 && pigeonId <= pigeonsCount, "Invalid pigeon ID");
        Pigeon memory pigeon = pigeons[pigeonId];
        return (pigeon.name, pigeon.owner, pigeon.arrivalTime);
    }

    function checkPigeonsCount() public view {
        // This should never fail
        assert(pigeonsCount >= 0);
    }

    function forceRevert() public pure {
        revert("This function always reverts");
    }
}
