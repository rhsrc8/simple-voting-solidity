// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {

    address public owner;
    uint256 public totalDonations;

    mapping(address => uint256) public donations;

    constructor() {
        owner = msg.sender;
    }

    // Bağış yapma fonksiyonu
    function donate() public payable {
        require(msg.value > 0, "Bagis miktari 0 olamaz");

        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
    }

    // Owner parayi ceker
    function withdraw() public {
        require(msg.sender == owner, "Sadece owner cekebilir");

        payable(owner).transfer(address(this).balance);
    }

    // Kontrat bakiyesi
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
