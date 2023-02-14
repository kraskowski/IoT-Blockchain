pragma solidity ^0.8.0;

contract AccessControl {

    // Define the owner of the contract
    address public owner;

    // Define a mapping to store the access control policies for each device
    mapping (address => bool) public accessControlPolicies;

    // Define an event to log when a new device is added to the access control list
    event DeviceAdded(address indexed device);

    // Define an event to log when a device is removed from the access control list
    event DeviceRemoved(address indexed device);

    // Constructor function to set the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Function to add a device to the access control list
    function addDevice(address _device) public {
        // Check if the sender is the owner of the contract
        require(msg.sender == owner, "Only the owner can add devices to the access control list");

        // Add the device to the access control list
        accessControlPolicies[_device] = true;

        // Emit an event to log the device added
        emit DeviceAdded(_device);
    }

    // Function to remove a device from the access control list
    function removeDevice(address _device) public {
        // Check if the sender is the owner of the contract
        require(msg.sender == owner, "Only the owner can remove devices from the access control list");

        // Remove the device from the access control list
        accessControlPolicies[_device] = false;

        // Emit an event to log the device removed
        emit DeviceRemoved(_device);
    }

    // Function to check if a device is allowed access
    function isAllowed(address _device) public view returns (bool) {
        return accessControlPolicies[_device];
    }
}
