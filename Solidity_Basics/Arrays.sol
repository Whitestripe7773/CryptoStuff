// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ////////// Arrays ///////////
    /////////////////////////////

contract ArraysContract {

    uint[] public array1 = [1, 2, 3];
    uint[] public array2;
    uint[10] public array3;
    string[] public array4 = ["apple", "banana", "carrot"];
    string[] public array5;
    string[10] public array6;

    // Gets the element of the index in the array 
    function arrayGet(uint i) public view returns (uint) {
        return array1[i];
    }

    // Get the length of an array
    function arrayGetLength() public view returns (uint) {
        return array1.length;
    }

    // Add element to the end of the array
    function push(uint i) public {
        array1.push(i);
    }

    // Remove the last element of the array
    function pop() public {
        array1.pop();
    }

    // Remove/Delete element on index of array
    function remove(uint index) public {
        delete array1[index];
    }
}
