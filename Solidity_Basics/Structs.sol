// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

    /////////////////////////////
    ////////// Structs //////////
    /////////////////////////////

contract StructsContract {
    
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
}
