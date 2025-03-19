pragma solidity 0.8.29;

contract SimpleStorage {
    uint256 private storedData;

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256) {
        return storedData;
    }

    struct UserInfo {
        string name;
        uint256 age;
    }

    mapping(address => UserInfo) public userData;
    mapping(address => uint256) public data;

    constructor(address initialOwner) {
        owner = initialOwner;
        creationTime = block.timestamp;
    }
}
