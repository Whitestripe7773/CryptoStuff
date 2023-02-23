// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    //////// Constructor ////////
    /////////////////////////////

contract ConstructorContract {

    string public name = "Testname";

    // This function is ran only once when the contract is initialized /
    // deployed on the blockchain
    constructor(string memory _name) {
        name = _name;
    }
}
