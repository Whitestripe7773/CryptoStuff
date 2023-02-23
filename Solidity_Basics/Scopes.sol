// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    //// Visibility (Scopes) ////
    /////////////////////////////

contract ScopesContract {

    /*
     * name1 = no visibility
     * name2 = private -> only inside the smart contract
     * name3 = internal -> only inside but can be inherited
     * name4 = public -> inside, outside, inherited calls
     */
    string name1 = "name 1";
    string private name2 = "name 2";
    string internal name3 = "name 3";
    string public name4 = "name 4";

    uint public count;

    // This function can be called outside the smart contract
    function increment1() public {
        count = count + 1;
    }

    // increment1() can also be called by another function
    function increment2() public {
        increment1();
    }

    // This can be called only inside the smart contract
    function increment3() private {
        count = count + 1;
    }

    // A private function can be called inside within another function
    function increment4() public {
        increment3();
    }

    // This function can only be called outside the smart contract
    function increment5() external {
        count = count + 1;
    }

    // This function can only be called inside the smart contract
    function increment6() internal {
        count = count + 1;
    }

    // The internal can be called from another function for example
    function increment7() public {
        increment6();
    }
}
