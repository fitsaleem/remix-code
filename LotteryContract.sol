// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// create a lottery smart contract using solidity
 // it will allow to multipe users to  participante in the game and select a winner based on rendom selection
 // and in the end ethers will give it to winning candidate

 contract LotteryContract{

    address public manager;  //store manage address

    address payable [] public  participents; //store etherium addresses of users who participents

    address payable public winner;

    constructor(){
        manager=msg.sender;   //only manager can deploy smart contract
    }
    
    receive() external  payable {
       
       require(msg.value==0.25 ether,"must be 1 ehter to participate");
       participents.push(payable (msg.sender));
    }

    function getBalance() public view returns (uint){
        require(msg.sender==manager, "must be a manager");
        return address  (this).balance;

    }

    // now selecting the winner

    function getRandom() public view returns (uint){

      return  uint(keccak256( abi.encodePacked(block.difficulty,block.timestamp,participents.length))) ;

    }

    function pickWinner() public {
        require(msg.sender==manager);
        require(participents.length>=2);
        uint r= getRandom();
        uint index=r%participents.length;
        winner=participents[index];
        winner.transfer(getBalance());
        participents=new address payable [](0);


    }

 }
