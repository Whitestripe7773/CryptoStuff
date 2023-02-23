// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ///// Global Variables //////
    /////////////////////////////

contract GlobalVariablesContrac {

    address public contractAddress;
    address public payer;
    address public origin;
    uint public amount;

    constructor() {
        contractAddress = address(this);
    }

    function pay() public payable {
        payer = msg.sender;     // Message -> In this ex. sender (address of the sender)
        origin = tx.origin;     // Transaction -> In this ex. origin
        amount = msg.value;     // Message -> In this ex. value (amount of crypto sent with the transaction)
    }

    function getBlockInfo() public view returns (uint, uint, uint) {
        return (
            block.number,           // Number of the block
            block.timestamp,        // Timestamp of the block
            block.chainid           // ChainId of the block
        );
    }
}
