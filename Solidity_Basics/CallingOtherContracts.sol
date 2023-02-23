// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    // Calling other contract ///
    /////////////////////////////

// This contract just stores a secret on the chain
contract SecretVault {
    string private secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function setSecret(string memory _secret) external {
        secret = _secret;
    }

    function getSecret() external view returns (string memory) {
        return secret;
    }
}

// This contract calls a function from the 'SecretVault' contract
contract CallingOtherContractsContract {
    // We create an 'object' of the contract
    SecretVault public secretVault;

    constructor(SecretVault _secretVault) {
        secretVault = _secretVault;
    }

    // We call setSecret from the SecretVault Contract
    function setSecret(string memory _secret) public {
        secretVault.setSecret(_secret);
    }

    // We call getSecret from the SecretVault Contract
    function getSecret() public view returns (string memory) {
        return secretVault.getSecret();
    }
}
