// It is important to write the used version on top 'pragma solidity ^x.x.x;'

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    /////// General info ////////
    /////////////////////////////

contract GeneralContract {

    string public myString = "Test";                                        // String
    bool public boolean1 = true;                                            // Boolean
    uint public myUint = 1;                                                 // Unsigned Integer
    int public myInt = -1;                                                  // Integer
    address public myAddress = 0x4ea8a15240789Dd72383B2E0f56AE0053498C847;  // Address

    string public name = "TestName";
    // name = _name -> Same as this.name = name in Java etc. 
    // Writing to a blockchain (setter) cost gas
    function setName(string memory _name) public{
        name = _name;
    }

    // Reading from a blockchain is free
    function getNameGeneral() public view returns (string memory) {
        return name;
    }

    // This function is only accessable inside this Smart Contract
    function resetName() internal {
        name = "TestName";
    }
}
