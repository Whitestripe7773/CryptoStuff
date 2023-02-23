// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ///////// Interface /////////
    /////////////////////////////

// Creating an interface called 'IERC20'
interface IERC20 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        external
        returns (bool success);
}

contract InterfaceContract {
    // Calling the function within the interface
    function deposit (address _tokenAddress, uint _amount) public {
        IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount);
    }
}
