pragma solidity >=0.7.0 <0.9.0;

contract deadManSwitch 
{
    address owner;
    address PRESETAddress;
    uint lastActiveBlock;

    constructor(address _PRESETAddress) 
    {
        owner = msg.sender;
        PRESETAddress = _PRESETAddress;
        lastActiveBlock = block.number;
    }
    
    function still_alive() public 
    {
        require(msg.sender == owner);
        lastActiveBlock = block.number;
    }
    
    function Alive() public view returns (bool) 
    {
        if(block.number - lastActiveBlock <= 10) return true;
        else return false;
    }
    
    function transferFunds() public 
    {
        require(!Alive());
        uint contractBalance = address(this).balance;
        payable(PRESETAddress).transfer(contractBalance); 
    }
}
