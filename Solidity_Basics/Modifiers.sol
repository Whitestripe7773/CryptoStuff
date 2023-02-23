// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ///////// Modifiers /////////
    /////////////////////////////

contract ModifiersContract {   
    
    string public name = "TestName";

    // view -> Does not modify the state of the blockchain but read the state
    function getName() public view returns(string memory) {
        return name;
    }

    // pure -> Does not modify the state and cannot read it
    function modifiersAdd(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    uint public balance = 0;
    // payable -> Allowed to receive ether whenever the transaction has been submitted
    function modifierPay() public payable {
        balance = msg.value;
    }

    /////////////////////////////
    ////// Custom Modifiers /////
    /////////////////////////////

    address private ownerCustomModifier;
    string public nameCustomModifier = "";
    
    // This modify destricts non owner from specific calls (that this modifier is attached to)
    modifier onlyOwner {
        require(msg.sender == ownerCustomModifier, 'caller must be the owner');
        _;
    }

    // The custom modifier is used in this function
    function setNameCustomModifier(string memory _name) onlyOwner public {
        nameCustomModifier = _name;
    }
}
