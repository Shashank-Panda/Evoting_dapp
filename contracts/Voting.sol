// SPDX-License-Identifier: MIT
//events have to be added
pragma solidity 0.8.17;

contract Voting {
    address private owner;
    uint256 numVoters;
    uint256 numCandidates;

    struct candidate {
        bytes32 candidate_id;
        bytes32 party_name;
    }

    struct voter {
        bytes32 voter_id;
        bytes32 voted_candidate_id;
    }

    mapping(uint256 => candidate) cmap;
    mapping(uint256 => voter) vmap;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function addCandidate(bytes32 candidate_id, bytes32 party_name) private onlyOwner
    {
        uint256 c_id = numCandidates++;
        cmap[c_id] = candidate(candidate_id, party_name);
        //some code for frontend
    }

    function addVote(bytes32 voter_id, bytes32 candidate_id) public {
        //what is the need to check if the candidate exists or not in here?, because if the candidate does not exist,
        //then it won't be shown on the frontend
        uint256 v_id = numVoters++;
        vmap[v_id] = voter(voter_id, candidate_id);
    }

    //Getter functions

    // finds the total amount of votes for a specific candidate by looping
    // through voters
    function totalVotes(bytes32 candidate_id) public view returns (uint256) {
        uint256 numOfVotes = 0; // we will return this
        for (uint256 i = 0; i < numVoters; i++) {
            // if the voter votes for this specific candidate, we increment the number
            if (vmap[i].voted_candidate_id == candidate_id) {
                numOfVotes++;
            }
        }
        return numOfVotes;
    }

    function getNumOfCandidates() public view returns (uint256) {
        return numCandidates;
    }

    function getNumOfVoters() public view returns (uint256) {
        return numVoters;
    }

    // returns candidate information, including its ID, name, and party
    function getCandidate(uint256 candidateID)
        public
        view
        returns (
            uint256,
            bytes32,
            bytes32
        )
    {
        return (
            candidateID,
            cmap[candidateID].candidate_id,
            cmap[candidateID].party_name
        );
    }
}
