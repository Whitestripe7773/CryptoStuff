// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    //// Logical Operators //////
    /////////////////////////////

contract LogicalOperatorsContract {

    // Is equal
    function eq(uint a, uint b) external pure returns(bool) {
        return a == b;
    }

    // Is not equal
    function notEq(uint a, uint b) external pure returns(bool) {
        return a != b;
    }

    // Greater than
    function gt(uint a, uint b) external pure returns(bool) {
        return a > b;
    }

    // Lower than
    function lt(uint a, uint b) external pure returns(bool) {
        return a < b;
    }

    // Greater than or equal
    function gtOrEq(uint a, uint b) external pure returns(bool) {
        return a >= b;
    }

    // Lower than or equal
    function ltOrEq(uint a, uint b) external pure returns(bool) {
        return a <= b;
    }
    
    // Example of non-integer comparison
    function checkAddress() external pure returns (bool) {
        address address1 = 0x4ea8a15240789Dd72383B2E0f56AE0053498C847;
        address address2 = 0x4ea8a15240789Dd72383B2E0f56AE0053498C847;
        return (address1 == address2);
    }

    // If a AND b
    function and(bool a, bool b) external pure returns(bool) {
        return a && b;
    }

    // If a OR b
    function or(bool a, bool b) external pure returns(bool) {
        return a || b;
    }

    // If NOT a
    function not(bool a) external pure returns(bool) {
        return !a;
    }

    // If 1 + 1 IS 2 AND 2 + 2 IS 4
    function logicalOperatorExample() external pure returns(bool) {
        return (1 + 1 == 2) && (2 + 2 == 4);
    }
}
