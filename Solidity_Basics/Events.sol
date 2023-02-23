// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ////////// Events ///////////
    /////////////////////////////

contract Events {

    string public eventMessage = "Hello World";

    // You can add up to 3 indexed (you can filter through these)
    // You can add up to 17 data elements ("_message")
    event MessageUpdated(
        address indexed _user,
        string _message
    );

    // It is possible to subscribe to this event
    // It is also traceable on the blockchain
    function updateMessage(string memory _message) public {
        eventMessage = _message;
        // emits the event
        emit MessageUpdated(msg.sender, _message);
    }
}
