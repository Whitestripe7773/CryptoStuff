// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract MyContract {

    /////////////////////////////
    /////// General info ////////
    /////////////////////////////

    string public myString = "Test";                                        // String
    bool public boolean1 = true;                                            // Boolean
    uint public myUint = 1;                                                 // Unsigned Integer
    int public myInt = -1;                                                  // Integer
    address public myAddress = 0x4ea8a15240789Dd72383B2E0f56AE0053498C847;  // Address

    string public name = "TestName";
    // name = _name -> Same as this.name = name in Java etc. 
    // Writing to a blockchain (setter) cost gas
    function setName(string memory _name) public{
        name = _name;
    }

    // Reading from a blockchain is free
    function getNameGeneral() public view returns (string memory) {
        return name;
    }

    // This function is only accessable inside this Smart Contract
    function resetName() internal {
        name = "TestName";
    }


    /////////////////////////////
    //// Visibility (Scopes) ////
    /////////////////////////////

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


    /////////////////////////////
    ///////// Modifiers /////////
    /////////////////////////////

    // view -> Does not modify the state of the blockchain but read the state
    function getName() public view returns(string memory) {
        return name;
    }

    // pure -> Does not modify the state and cannot read it
    function modifiersAdd(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    uint public balance = 0;
    // payable -> Allowed to receive ether whenever the transaction has been submitted
    function modifierPay() public payable {
        balance = msg.value;
    }

    /////////////////////////////
    ////// Custom Modifiers /////
    /////////////////////////////

    address private ownerCustomModifier;
    string public nameCustomModifier = "";
    
    // This modify destricts non owner from specific calls (that this modifier is attached to)
    modifier onlyOwner {
        require(msg.sender == ownerCustomModifier, 'caller must be the owner');
        _;
    }

    // The custom modifier is used in this function
    function setNameCustomModifier(string memory _name) onlyOwner public {
        nameCustomModifier = _name;
    }

    
    /////////////////////////////
    //////// Constructor ////////
    /////////////////////////////

    // This function is ran only once when the contract is initialized /
    // deployed on the blockchain
    /*
        constructor(string memory _name) {
            name = _name;
        }
    */

    /////////////////////////////
    ///// Global Variables //////
    /////////////////////////////

    address public contractAddress;
    address public payer;
    address public origin;
    uint public amount;

    constructor() {
        contractAddress = address(this);
    }

    function pay() public payable {
        payer = msg.sender;     // Message -> In this ex. sender (address of the sender)
        origin = tx.origin;     // Transaction -> In this ex. origin
        amount = msg.value;     // Message -> In this ex. value (amount of crypto sent with the transaction)
    }

    function getBlockInfo() public view returns (uint, uint, uint) {
        return (
            block.number,           // Number of the block
            block.timestamp,        // Timestamp of the block
            block.chainid           // ChainId of the block
        );
    }

    
    /////////////////////////////
    //////// Operators //////////
    /////////////////////////////

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

    /////////////////////////////
    //// Logical Operators //////
    /////////////////////////////

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

    /////////////////////////////
    /// Conditionals/Ternary ////
    /////////////////////////////

    function evenOrOdd1(uint x) public pure returns (string memory) {
        if (x % 2 == 0) {
            return "even";
        } else {
            return "odd";
        }
    }

    function evenOrOdd2(uint x) public pure returns (string memory) {
        if (x % 2 == 0) {
            return "even";
        }
        return "odd";
    }

    function evenOrOdd3(uint x) public pure returns (string memory) {
        return x % 2 == 0 ? "even" : "odd";
    }

    /////////////////////////////
    ////////// Arrays ///////////
    /////////////////////////////

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

    /////////////////////////////
    // Mappings/KeyValue Pairs //
    /////////////////////////////

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

    /////////////////////////////
    ////////// Structs //////////
    /////////////////////////////

    struct Book {
        string title;
        string author;
        bool completed;
    }

    // Array of books
    Book[] public books;

    // Add book to array
    function addBook(string memory _title, string memory _author) public {
        books.push(Book(_title, _author, false));
    }

    // Gets book by index
    function getBook(uint _index)
        public
        view
        returns (string memory title, string memory author, bool completed) {
            Book storage book = books[_index];
            return (book.title, book.author, book.completed);
    }

    // Update completed books
    function complete(uint _index) public {
        Book storage book = books[_index];
        book.completed = true;
    }

    /////////////////////////////
    ////////// Events ///////////
    /////////////////////////////

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


    /////////////////////////////
    /////////// Ether ///////////
    /////////////////////////////

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

    /////////////////////////////
    ////// Error handling ///////
    /////////////////////////////

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

    /////////////////////////////
    /////// Inheritance /////////
    /////////////////////////////


// New contract to inherit from
contract Ownable {
        address owner;
        constructor() {
            owner = msg.sender;
        }

        modifier onlyOwner {
            require(msg.sender == owner, 'Caller must be the owner');
        _;
    }
}

// This contract inherits from "Ownable" Contract
contract MyContract2 is Ownable {
    string public name = "Example 1";

    // onlyOwner modifier got inherited
    function setName(string memory _name) public onlyOwner {
        name = _name;
    }
}

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

contract myContractForSecret {
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


    /////////////////////////////
    ///////// Interface /////////
    /////////////////////////////

interface IERC20 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        external
        returns (bool success);
}

contract MyContractForInterface {
    
    // Calling the function within the interface
    function deposit (address _tokenAddress, uint _amount) public {
        IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount);
    }
}
