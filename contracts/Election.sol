pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //Store accounts that have voted
    mapping(address => bool) public voters;

    // Store Candidates

    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        // candidate = "Candidate 1";
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
    
    function vote (uint _candidateId) public {
        // required that they have not voted before
        require(!voters[msg.sender]);
        // required a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;
        // msg.sender
        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
    
    
}