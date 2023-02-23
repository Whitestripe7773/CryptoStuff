// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ////// Error handling ///////
    /////////////////////////////

contract ErrorHandlingContract {
    
    event Log(string message);

    // _value must be greater than 10 or an error message will be thrown
    // Otherwise it will log a "Success" message
    function errorExample1(uint _value) public {
        require(_value > 10, "must be greater than 10");
        emit Log("Success");
    }

    // If _value <= 10 then revert 
    // Revert will undo all state changes,
    // refund all remaining gas to the sender,
    // You can also return something
    function errorExample2(uint _value) public {
        if (_value <= 10) {
            revert("must be greater than 10");
        }
        emit Log("Success");
    }
}
