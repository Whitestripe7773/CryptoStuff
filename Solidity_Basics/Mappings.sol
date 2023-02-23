// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    // Mappings/KeyValue Pairs //
    /////////////////////////////

contract MappingsContract {

    // Key => Value scope nameOfMapping
    mapping (uint => string) public names;                       // uint : string
    mapping (uint => address) public addresses;                  // uint : address
    mapping (address => uint) public balances;                   // address : uint
    mapping (address => bool) public hasVoted;                   // address : bool
    mapping (address => mapping(uint => bool)) public myMapping; //address : mapping(uint : bool)

    mapping(uint => string) public myMapping2;

    // Fetching a mapping by key
    function mappingGet(uint _id) public view returns (string memory) {
        return myMapping2[_id];
    }

    // Settings a value by key
    function mappingSet(uint _id, string memory _value) public {
        myMapping2[_id] = _value;
    } 

    // Removing by key
    function mappingRemove(uint _id) public {
        // Resets the value to the default value
        delete myMapping2[_id];
    }
}
