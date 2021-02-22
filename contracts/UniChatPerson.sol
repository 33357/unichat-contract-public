// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

import "./interfaces/IUniChatPerson.sol";
import "../libraries/AcceptedCaller.sol";

contract UniChatPerson is IUniChatPerson,AcceptedCaller {
    // event createPersonEvent(address indexed main, string name);
    // event addPersonAddressEvent(address indexed main, address indexed wallet);
    // event setPersonNameEvent(address indexed main, string name);

    struct Person {
        //string name;
        //address [] wallets;
        uint256 [] messageIds;
    }

    mapping(address => Person) persons;

    //set Person
    // function createPerson(string memory name)public{
    //     address[] memory wallets = new address[](1);
    //     wallets[0]=msg.sender;
    //     persons[msg.sender]= Person(name,wallets);
    //     emit createPersonEvent(msg.sender, name);
    // }

    // function addPersonAddress(address wallet)public{
    //     persons[wallet]=persons[msg.sender];
    //     persons[msg.sender].wallets.push(wallet);
    //     emit addPersonAddressEvent(persons[msg.sender].wallets[0], wallet);
    // }

    // function setPersonName(string memory name)public{
    //     persons[msg.sender].name=name;
    //     emit setPersonNameEvent(persons[msg.sender].wallets[0], name);
    // }

    function addMessageId(address person, uint256 messageId)
        external
        onlyAcceptedCaller
        override
        returns (bool)
    {
        persons[person].messageIds.push(messageId);
        return true;
    }

    function getMessageIds(address person)
        external
        view
        override
        returns (uint256[] memory)
    {
        return (persons[person].messageIds);
    }
}
