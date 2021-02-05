pragma solidity ^0.7.4;

contract GroupContract {
    event createGroupEvent(address bidder, uint amount);

     struct Group {
        string name;
        address[] tokens;
        uint[] balances;
        address manager;
    }
     
    mapping(address=>Group) groups;
    //set Group
    function createGroup(address group,string memory name,address[] memory tokens ,uint[] memory balances) public {
        groups[group]=Group(name,tokens,balances,msg.sender);
    }

    function setGroupMinBalance(address group,address[] memory tokens ,uint[] memory balances) public {
        require(msg.sender==groups[group].manager);
        groups[group].tokens=tokens;
        groups[group].balances=balances;
    }

    function setGroupManager(address group,address manager) public {
        require(msg.sender==groups[group].manager);
        groups[group].manager=manager;
    }

    // get Group
    function getGroupName(address group) public view returns (string memory){
        return groups[group].name;
    }

    function getGroupTokenBalances(address group) public view returns (address[] memory,uint[] memory){
        return (groups[group].tokens,groups[group].balances);
    }

    function getGroupManager(address group) public view returns (address){
        return groups[group].manager;
    }

}