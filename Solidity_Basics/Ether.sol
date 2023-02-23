// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    /////////// Ether ///////////
    /////////////////////////////

contract EtherContract {
    
    uint public vWei = 1 wei;
    uint public valueWai = 1;
    uint public vGwei = 1 gwei;
    uint public valueGwei = 1000000000;
    uint public vEther = 1 ether;
    uint public valueEther = 1000000000000000000;

    uint public etherCount = 0;

    // Receive ether function
    receive() external payable {}

    // Receive ether by fallback function if no receive() func is implemented
    // And if msg or msg data is not present
    // You can also add any arbitrary business logic inside the function
    fallback() external payable {
        etherCount ++;
    }

    // Checks the contract balance
    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Sends ether to any address
    // Any function can receive ether as long as you use the 'payable' modifier
    function transfer(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed");
    }
}
