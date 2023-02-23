// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    //////// Operators //////////
    /////////////////////////////

contract OperatorsContract {

    function add(uint a, uint b) external pure returns(uint){
        return a + b;
    }

    function sub(uint a, uint b) external pure returns(uint){
        return a - b;
    }

    function mul(uint a, uint b) external pure returns(uint) {
        return a * b;
    }

    function div(uint a, uint b) external pure returns(uint) {
        return a / b;
    }

    function exp(uint a, uint b) external pure returns(uint) {
        return a ** b;
    }

    function mod(uint a, uint b) external pure returns(uint) {
        return a % b;
    }

    function increment(uint a) external pure returns (uint) {
        a++;
        return a;
    }

    function decrement(uint a) external pure returns (uint) {
        a--;
        return a;
    }

    function mathExample() external pure returns(uint) {
        uint a;
        a = a + 1;          // 1
        a ++;               // 2
        a = a * 2;          // 4
        a = a ** 2;         // 16
        a = a / 2;          // 8
        a = a - 1;          // 7
        a --;               // 6
        return a; 
    }
}
