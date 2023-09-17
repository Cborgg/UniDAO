pragma solidity >=0.7.0 <0.9.0;

contract DeadmanSwitch 
{
    address owner;
    uint lastBlock;
    address PRESETAddress;
    
    constructor(address _PRESETAddress) 
    {
        owner = msg.sender;
        PRESETAddress = _PRESETAddress;
        lastBlock = block.number;
    }

    function Alive() public view returns (bool) 
    {
        if(block.number - lastBlock <= 10)
        return true;
        else
        return false;
    }
    
    function still_alive() public 
    {
        require(msg.sender == owner);
        lastBlock = block.number;
    }
    
    
    function transferFunds() public 
    {
        require(!Alive());
        uint contractBalance = address(this).balance;
        payable(PRESETAddress).transfer(contractBalance); 
    }
}
