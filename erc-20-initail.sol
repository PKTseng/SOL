contract SimpleToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply * 10 ** unit256(_decimals);
        balanceOf[msg.sender] = totalSupply;
    }
}

contract Crowdfunding {
    address public beneficiary;
    uint256 public fundingGoal;
    uint256 public totalRaised;
    mapping(address => uint256) public donations;

    constructor(address _beneficiary, uint256 _fundingGoal) payable {
        beneficiary = _beneficiary;
        fundingGoal = _fundingGoal;

        if (msg.value > 0) {
            donations[msg.sender] = msg.value;
            totalRaised = msg.value;

            emit DonationsReceived(msg.sender, msg.value);
        }
    }

    event DonationReceived( address , donor, uint256 amount)
}
