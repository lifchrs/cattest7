pragma solidity ^0.5.0;

contract Voting{
    uint public itemCount = 0;

    struct Item{
        uint id; 
        uint numPos;
        uint numNeg; 
        string content;
        bool completed;  
    }
    mapping(uint => Item) public items; //mapping itemNumber to the item

    event ItemCreated(
        uint id,
        uint numPos,
        uint numNeg,
        string content,
        bool completed
    );

    event ItemCompleted(	
        uint id,	
        bool completed
    );

    constructor() public{
        createTask("default item");
    }

    function createTask(string memory _content) public{
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount,0,0,_content,false);
    }
    
    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }

}