pragma solidity ^0.6.4;

contract Voting {

    mapping (bytes32 => uint256) public votes;

    bytes32[] public candidates;

    constructor(bytes32[] memory candidates_) public {
        candidates = candidates_;
    }

    function readVotes(bytes32 candidate) public view returns (uint256) {
        require(isCandidateValid(candidate));
        return votes[candidate];
    }

    function giveVote(bytes32 candidate) public {
        require(isCandidateValid(candidate));
        votes[candidate] += 1;
    }

    function isCandidateValid(bytes32 candidate) public view returns (bool) {
        for (uint i = 0; i < candidates.length; ++i) {
            if (candidates[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}