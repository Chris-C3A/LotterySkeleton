// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // owner of the lottery
    address public owner;

    // players in the lottery
    address payable[] private players;

    // winner address of the lottery
    address payable private winner;

    // minimum bet
    uint public minimumBet;

    // duration of the lottery
    uint public durationHours;
    // deadline
    uint public deadline;

    // isLotteryOpen
    bool public isLotteryOpen;
    
    // constructor function
    // takes duration as parameter
    constructor(uint _durationHours) {
      // assign the sender as owner of the contract
      owner = msg.sender;
      // initialize minimum bet
      minimumBet = 0.01 ether;
      // initialize durationHours
      durationHours = _durationHours;

      // initalize lottery as closed
      isLotteryOpen = false;
    }

    // receive eth function
    receive() external payable {
        // all Ether sent directly to this contract's address will run this function

        // call enterLottery() function
        enterLottery();
   }
    
    function enterLottery() public payable {
        require(msg.value >= minimumBet, "Bet amount is not enough.");
        require(block.timestamp < deadline, "Lottery is already closed.");
        require(isLotteryOpen, "Lottery is already closed.");

        // add player as payable object
        players.push(payable(msg.sender));

    }

    function openLottery() public {
        require(msg.sender == owner, "Only the owner can open the lotter.");
        require(!isLotteryOpen, "Lottery already open.");

        // add deadline date here
        deadline = block.timestamp + durationHours*3600;

        // set lottery to open
        isLotteryOpen = true;
    }
    
    function closeLottery() public {
        require(msg.sender == owner, "Only the owner can close the lottery.");
        require(isLotteryOpen, "Lottery is already closed.");

        // set lottery to closed
        isLotteryOpen = false;
    }
    
    function selectWinner() public {
        require(msg.sender == owner, "Only the owner can select the winner.");
        require(!isLotteryOpen, "Lottery is not closed yet.");
        require(players.length > 0, "No players participated in the lottery.");
        
        // get random index
        uint index = random() % players.length;

        // set winner equal to the ranodm index in players
        winner = players[index];

        // transfer the lottery pot to the winner
        (bool sent,) = winner.call{value: getLotteryPot()}("");
        require(sent, "Failed to send Ether");

        // reset players and number of players
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }

    /*
     * Getters
    */
    
    // get Players
    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    // get Winner
    function getWinner() public view returns (address payable) {
        return winner;
    }

    // get Lotter Pot
    function getLotteryPot() public view returns (uint) {
        return address(this).balance;
    }
}