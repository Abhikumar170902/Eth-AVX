// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // View function: does not modify state variables, returns data
    function getResult (uint256 num1, uint256 num2) public pure returns (uint256 ) {
        return num1 + num2;
    }

    // Pure function: does not access state variables, returns data
    function multiply(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 * num2;
    }

    // Payable function: can receive Ether
    function deposit() public payable {}

    // Accessing view, pure, and payable functions within the contract
    function performOperations(uint256 num1, uint256 num2) public payable returns (uint256) {
        // Accessing view function
        uint256 sum = getResult(num1, num2);

        // Accessing pure function
        uint256 product = multiply(num1, num2);

        // Accessing payable function
        (bool success, ) = address(this).call{value: msg.value}("");
        require(success, "Deposit failed");

        return sum + product;
    }
}

// Derived contract that inherits from MyContract
contract DerivedContract is MyContract {
    // Accessing view, pure, and payable functions in the derived contract
    function performDerivedOperations(uint256 num1, uint256 num2) public payable returns (uint256) {
        // Accessing view function from the base contract
        uint256 sum = getResult(num1, num2);

        // Accessing pure function from the base contract
        uint256 product = multiply(num1, num2);

        // Accessing payable function from the base contract
        (bool success, ) = address(this).call{value: msg.value}("");
        require(success, "Deposit failed");

        return sum + product;
    }
}
