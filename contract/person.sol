pragma solidity ^0.7.4;

contract PersonContract {
    event createPersonEvent(address indexed main, string name);
    event addPersonAddressEvent(address indexed main, address indexed wallet);
    event setPersonNameEvent(address indexed main, string name);

    struct Person {
        string name;
        address[] wallets;
    }
     
    mapping(address=>Person) persons;

    //set Person
    function createPerson(string memory name)public{
        address[] memory wallets = new address[](1);
        wallets[0]=msg.sender;
        persons[msg.sender]= Person(name,wallets);
        emit createPersonEvent(msg.sender, name);
    }

    function addPersonAddress(address wallet)public{
        persons[wallet]=persons[msg.sender];
        persons[msg.sender].wallets.push(wallet);
        emit addPersonAddressEvent(persons[msg.sender].wallets[0], wallet);
    }

    function setPersonName(string memory name)public{
        persons[msg.sender].name=name;
        emit setPersonNameEvent(persons[msg.sender].wallets[0], name);
    }

    //get Person
    function getPersonName(address wallet) public view returns (string memory ){
        return persons[wallet].name;
    }

    function getPersonWallets(address wallet) public view returns (address [] memory){
        return persons[wallet].wallets;
    }
}