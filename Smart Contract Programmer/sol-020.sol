// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StructExamples {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car[] public cars;

    function examples() external {
        // 3 ways to initialize a struct
        Car memory toyota = Car("Toyota", 1980, msg.sender);
        Car memory lambo = Car({
            model: "Lamborghini",
            year: 1999,
            owner: msg.sender
        });
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2020;
        tesla.owner = msg.sender;

        // Push to array
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);
        // Initialize and push in single line of code
        cars.push(Car("Ferrari", 2000, msg.sender));

        // Get reference to Car struct stored in the array cars at index 0
        Car storage car = cars[0];
        // Update
        car.year = 1988;
    }

    function register(string memory _model, uint _year) external {
        cars.push(Car({model: _model, year: _year, owner: msg.sender}));
    }

    function get(
        uint _index
    ) external view returns (string memory model, uint year, address owner) {
        Car storage auta = cars[_index];
        return (auta.model, auta.year, auta.owner);
    }

    function transfer(uint _index, address _owner) external {
        Car storage prdel = cars[_index];
        prdel.owner = _owner;
    }
}