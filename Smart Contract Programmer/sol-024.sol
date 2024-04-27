// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }
    
    Todo[] public todos;
    
    function create(string  calldata _text) external {
        todos.push(Todo({text:_text, completed: false}));
    }
    
    function updateText(uint _index, string calldata _text) external {
        Todo storage prdel = todos[_index];
        prdel.text = _text;
    }
    
    function toggleCompleted(uint _index) external {
        Todo storage hoven = todos[_index];
        hoven.completed =! hoven.completed;
    } 
    
    function get(uint _index) external view returns (string memory, bool) {
       //Todo storage kekel = todos[_index];
        //return (kekel.text, kekel.completed);
        return (todos[_index].text, todos[_index].completed);
    }
    
    
    
    
    
}