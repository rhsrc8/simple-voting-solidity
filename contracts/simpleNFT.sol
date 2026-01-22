// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
  OpenZeppelin ERC721:
  https://github.com/OpenZeppelin/openzeppelin-contracts
*/

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleNFT is ERC721, Ownable {

    uint256 public tokenCounter;

    constructor() ERC721("SimpleNFT", "SNFT") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function mintNFT(address to) public onlyOwner {
        _safeMint(to, tokenCounter);
        tokenCounter++;
    }
}
