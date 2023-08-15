// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract MyContract{

// state veriables are decleared inside the contract but outside the functions.

// uint public testNumber;

// constructor( uint new_num){

//     testNumber=200;
//     new_num=testNumber+300;

// }

// function show() public pure returns (uint) {
//     uint test=10;
//     return  test;
// }

// function are in solidity that performed specific task for operations.

uint public  num; //remove public keywod when uncomment hte getter function

function setter(uint _numValue) public {

    num=_numValue;

}

//whenever we are tring to read state variable so we use "view" keyword in function
// getter function will automatically will created for public state veriables.
// function getter() public view returns (uint){
//     return num;
// }

// array

//fix lenght array

uint[4] public arr =[12,22,33,4];

// dynamic array

uint[] public  arr1;


function insert(uint items)public {
    arr1.push(items);
}

//The payable modifier in Solidity is used to allow a function to receive Ether. When you mark a function with the payable keyword, you are indicating that this function is expected to receive Ether during its execution. 
  
  function recived() payable external {

  }

  // you can also use in stat veriable

  address payable public owner;
}