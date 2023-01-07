// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract LandAgreement {

    address private owner;

    uint public price;

    bool public SellerPayClosingFee = false;


    constructor (uint price_) {

    owner = msg.sender;

    price = price_;

    SellerPayClosingFee = false;

    }

    modifier onlyOwner() {

        require(msg.sender == owner, "Only owner can update the agreement ");
        _;
    }


    function SetPrice (uint _price) public onlyOwner  {

    price = _price;

    }

    function   SetClosingAgreement (bool ownerPays) public onlyOwner {

    SellerPayClosingFee = ownerPays;

    }
}
