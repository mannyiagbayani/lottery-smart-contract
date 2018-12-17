pragma solidity >=0.5.0 <= 0.6.0;

contract Lottery {
    
    //----STATE VARIABLES-----
    //Manager = address of the EOA that deployed the contract and start the Lottery
    address public Manager;
    
    //List of all players
    address[] public PlayerAddresses;
    
    
    //----CONSTRUCTOR-----
    constructor() public {
        //initialized the Manager state variable
        Manager = msg.sender;
    }
    
    //----FUNCTIONS-----
    //Callback function that will add address to PlayerAddresses
    function () external payable {
        PlayerAddresses.push(msg.sender); 
    }
    
    //Calling this function will add the address to the PlayerAddresses
    function EnterLottery() payable public {
        PlayerAddresses.push(msg.sender);
    }
    
    //Calling this function will return the current balance of the contract
    function GetBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    
    
}