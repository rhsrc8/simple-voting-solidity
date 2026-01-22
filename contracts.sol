// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {

    string[] public candidates;
    mapping(string => uint256) public votes;
    mapping(address => bool) public hasVoted;

    constructor(string[] memory _candidates) {
        candidates = _candidates;
    }

    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender], "Zaten oy kullandiniz!");

        bool isValidCandidate = false;

        for (uint i = 0; i < candidates.length; i++) {
            if (
                keccak256(bytes(candidates[i])) ==
                keccak256(bytes(_candidate))
            ) {
                isValidCandidate = true;
                break;
            }
        }

        require(isValidCandidate, "Gecersiz aday!");

        votes[_candidate] += 1;
        hasVoted[msg.sender] = true;
    }

    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }
}

