// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    /////// Inheritance /////////
    /////////////////////////////

// New contract to inherit from
contract Ownable {
        address owner;
        constructor() {
            owner = msg.sender;
        }

        modifier onlyOwner {
            require(msg.sender == owner, 'Caller must be the owner');
        _;
    }
}

// This contract inherits from "Ownable" Contract
contract InheritanceContract is Ownable {
    string public name = "Example 1";

    // onlyOwner modifier got inherited
    function setName(string memory _name) public onlyOwner {
        name = _name;
    }
}
