pragma solidity ^0.4.17;

contract Adoption {

	address[16] public adopters; 
	//an array of Ethereum addresses

	/**
	Solidity requires defining the return type of a function in ()
	**/

	// Adopting a pet
	function adopt(uint petId) public returns (uint) { 

	require(petId >= 0 && petId <= 15); 
	//ensure the pet ID is within range

	adopters[petId] = msg.sender; 
	//the address of the person or smart contract who called this function

	return petId;

	}

	//Retrieving the adopters
	function getAdopters() public view returns (address[16]){
		return adopters;
	}

}




