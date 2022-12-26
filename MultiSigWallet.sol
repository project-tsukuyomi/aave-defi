pragma solidity ^0.8.10;

contract MultiSigWallet {
    event Deposit();
    event Submit();
    event Approve();
    event Revoke();
    event Execute();

    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
    }
    address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public required;

    Transaction[] public transactions;
    mapping(uint256 => mapping(address => bool)) public approved;

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length > 0, "Owners Required");
    }
}
