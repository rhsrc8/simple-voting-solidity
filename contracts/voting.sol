// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {

    // Aday isimleri
    string[] public candidates;

    // Aday => oy sayısı
    mapping(string => uint256) public votes;

    // Oy kullanan adresler
    mapping(address => bool) public hasVoted;

    // Kurucu fonksiyon (deploy edilirken çalışır)
    constructor(string[] memory _candidates) {
        candidates = _candidates;
    }

    // Oy kullanma fonksiyonu
    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender], "Zaten oy kullandiniz!");
        
        bool isValidCandidate = false;

        // Aday kontrolü
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(candidates[i])) == keccak256(bytes(_candidate))) {
                isValidCandidate = true;
                break;
            }
        }

        require(isValidCandidate, "Gecersiz aday!");

        votes[_candidate] += 1;
        hasVoted[msg.sender] = true;
    }

    // Aday sayısını döndürür
    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }
}
