// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//https://x.com/CalyptusCareers/status/1806175628195930519

/* This smart contract is designed to save a list of different animals at the animal farm 🐖

What could go wrong?
*/

contract AnimalFarm {
    string[] public animals;

    constructor() {
        animals = new string[](0);
    }

    function addAnimal(string calldata animal) public {
        uint256 index = animals.length;
        animals[index] = animal;
    }

    function howManyAnimals() public view returns (uint256) {
        return animals.length;
    }

    function updateAnimalAt(uint rank, string calldata newAnimal)public {
        animals[rank] = newAnimal;   
    }

    // function addAnimal(string calldata animal) public {
    //     animals.push(animal);
    // }
}
