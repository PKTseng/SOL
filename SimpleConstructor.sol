// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleConstructor {
    // 狀態變量
    string public message;
    address public owner;
    uint256 public creationTime;

    // 事件 - 可以在部署時觀察
    event ContractCreated(address owner, string message, uint256 timestamp);

    // 構造函數 - 部署時執行
    constructor(string memory _initialMessage) {
        message = _initialMessage;
        owner = msg.sender;
        creationTime = block.timestamp;

        // 觸發事件
        emit ContractCreated(owner, message, creationTime);
    }

    // 一個可以更改 message 的函數
    function updateMessage(string memory _newMessage) public {
        // 只有合約擁有者可以更改訊息
        require(msg.sender == owner, "Only the owner can update the message");
        message = _newMessage;
    }

    // 一個讀取函數，顯示合約資訊
    function getContractInfo()
        public
        view
        returns (string memory, address, uint256)
    {
        return (message, owner, creationTime);
    }
}
