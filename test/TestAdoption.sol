pragma solidity ^0.4.17;

/*
the first two imports are global truffle files
not inside a truffle directory
*/

import "truffle/Assert.sol"; //provides various assertions to use in our testing
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol"; //this is the smart contract we want to test

contract TestAdoption {
	//create a smart contract instance of Adoption, which calls DeployedAddresses smart contract
	Adoption adoption = Adoption(DeployedAddresses.Adoption()); //public variable for testing purposes

	//testing the adopt() function
	//compare the return value of adopt() with the ID we passed in
	function testUserCanAdoptPet() public {
		uint returnedId = adoption.adopt(8); //this function returns the pet ID

		uint expected = 8;

		Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");

	}

	//testing retrieval of a single pet's owner
	function testGetAdopterAddressByPetId() public {
		address expected = this;

		//utilizes an automatic getter method because adoption is a public variable
		address adopter = adoption.adopters(8); //stores the address of the owner of pet 8

		Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded");

	}

	//testing retrieval of all pet owners
	//since arrays can only return a single value given a single key
	//getter function for the entire array
	function testGetAdopterAddressByPetIdInArray() public {
		//expected owner is this contract
		address expected = this;

		//store adopters array in memory rather than the contract's storage
		address[16] memory adopters = adoption.getAdopters();

		//compare location 8 in the array with testing contracts address
		Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
	}

}