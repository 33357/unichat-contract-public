// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

import "./interfaces/IUniChatGroup.sol";
import "../libraries/AcceptedCaller.sol";

contract UniChatGroup is IUniChatGroup,AcceptedCaller {
    //event createGroupEvent(address bidder, uint amount);

    struct Group {
        // string name;
        // address[] tokens;
        // uint[] balances;
        // bool isPpublic;
        // address manager;
        uint256 [] messageIds;
    }

    mapping(address => Group) groups;

    //set Group
    // function createGroup(address group,string memory name,address[] memory tokens ,uint[] memory balances,bool isPublic) public {
    //     groups[group]=Group({name:name,tokens,balances,isPublic,msg.sender});
    // }

    // function setGroupMinBalance(address group,address[] memory tokens ,uint[] memory balances) public {
    //     require(msg.sender==groups[group].manager);
    //     groups[group].tokens=tokens;
    //     groups[group].balances=balances;
    // }

    // function setGroupManager(address group,address manager) public {
    //     require(msg.sender==groups[group].manager);
    //     groups[group].manager=manager;
    // }

    // function setGroupPublic(address group,address manager) public {
    //     require(msg.sender==groups[group].manager);
    //     groups[group].manager=manager;
    // }

    // get Group

    function addMessageId(address group, uint256 messageId)
        external
        onlyAcceptedCaller
        override
        returns (bool)
    {
        groups[group].messageIds.push(messageId);
        return true;
    }

    function getMessageIds(address group)
        external
        view
        override
        returns (uint256[] memory)
    {
        return groups[group].messageIds;
    }
}
