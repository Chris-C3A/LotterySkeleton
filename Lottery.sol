// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // owner of contract
    // array of payable players
    // winner address
    // number of players
    // minimum bet
    // deadline
    // isLotteryClosed

    // constructor
    constructor(uint _minimumBet, uint _durationHours) {
        // assign the sender as owner of the contract
        
        // initialize minimum bet
        
        // initialize deadline
        
        // initialize lotteryClosed variable
        
    }
    
    // enter function
    function enter() public payable {
        require(, "Bet amount is not enough.");
        require(, "Lottery is already closed.");
        require(, "Lottery is already closed.");

        // add sender to array of players
    
        // increase number of players
    }

    function openLottery() public {
        require(, "Only the owner can open the lottery.");
        require(, "Lottery is already open.");
    }
    
    function closeLottery() public {
        require(, "Only the owner can close the lottery.");
        require(, "Lottery is already closed.");
    }
    
    function selectWinner() public {
        require(, "Only the owner can select the winner.");
        require(, "Lottery is not closed yet.");
        require(, "No players participated in the lottery.");
        
        // select random player to win

        // transfer the lottery pot to that player's address


        // reset the lottery
        // reset players array
        // reset number of players
        // reset lotteryClosed variable

    }
    
    // random helper function
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, numPlayers)));
    }
    
    // getters (gets players)
    function getPlayers() public view returns (address payable[] memory) {
        
    }

    function getWinner() public view returns (address payable) {
    }
}