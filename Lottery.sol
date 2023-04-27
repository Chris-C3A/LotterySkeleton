// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // owner of contract

    // array of payable players
    // winner address

    // minimum bet

    // duration of lottery

    // deadline

    // isLotteryOpen

    // constructor function
    // takes duration as parameter
    constructor() {
        // assign the sender as owner of the contract
        
        // initialize minimum bet
        
        // initialize duration
        
        // initialize isLotteryOpen variable
        
    }

    // receive eth function
    receive() external payable {
        // all Ether sent directly to this contract's address will run this function

        // call enterLottery() function
   }
    
    // enter function
    function enter() public payable {
        require(, "Bet amount is not enough.");
        require(, "Lottery is already closed.");
        require(, "Lottery is already closed.");

        // add sender to array of players as payable
    }

    function openLottery() public {
        require(, "Only the owner can open the lottery.");
        require(, "Lottery is already open.");

        // set deadline to current time + duration

        // set lottery to open
    }
    
    function closeLottery() public {
        require(, "Only the owner can close the lottery.");
        require(, "Lottery is already closed.");

        // set lottery to closed
    }
    
    function selectWinner() public {
        require(, "Only the owner can select the winner.");
        require(, "Lottery is not closed yet.");
        require(, "No players participated in the lottery.");
        
        // get random index of players array

        // set winner equal to the random index in players

        // transfer the lottery pot to the winner using the call method

    }
    
    // random helper function
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, numPlayers)));
    }
    
    // getters (gets players)
    // get players
    function getPlayers() public view returns (address payable[] memory) {
    }

    // get winner of the lottery
    function getWinner() public view returns (address payable) {
    }

    // get lottery pot (balance of the contract)
    function getLotteryPot() public view returns (uint) {
    }
}