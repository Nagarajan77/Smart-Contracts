// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.11;

contract VendingMachine {

    // state variables

    address public owner;

    mapping (address => uint)  cokeBalances;

    // set the owner as the address that deployed the contract

    // set the initial vending machine balance to 100

   constructor() {

    owner = msg.sender;

    cokeBalances[address(this)] = 100;

    }

    function getVendingMachineBalance() public view returns (uint) {

    return cokeBalances[address(this)];

    }

    // Let the owner restock the vending machine

    function restock(uint amount) public {

    require(msg.sender == owner, "Only the owner can restock.");

    cokeBalances[address(this)] += amount;
    

    }

    // Purchase donuts from the vending machine


    function purchase(uint amount) public payable {

    require(msg.value >= amount * 3 ether, "You must pay at least 1 ETH per coke");

    require(cokeBalances[address(this)] >= amount, "No stock  ");

    cokeBalances[address(this)] -= amount;

    cokeBalances[msg.sender] += amount;
    

    }

}
