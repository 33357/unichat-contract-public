// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

import "./interfaces/IUniChat.sol";
import "./interfaces/IUniChatPerson.sol";
import "./interfaces/IUniChatGroup.sol";
import "./interfaces/IUniChatMessage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UniChatMesssageRouter is IUniChat, Ownable {
    address public UniChatMessageAddr;
    address public UniChatGroupAddr;
    address public UniChatPersonAddr;

    function setUniChatMessageAddr(address uniChatMessageAddr)
        public
        onlyOwner
        returns (bool)
    {
        UniChatMessageAddr = uniChatMessageAddr;
        return true;
    }

    function setUniChatGroupAddr(address uniChatGroupAddr)
        public
        onlyOwner
        returns (bool)
    {
        UniChatGroupAddr = uniChatGroupAddr;
        return true;
    }

    function setUniChatPersonAddr(address uniChatPersonAddr)
        public
        onlyOwner
        returns (bool)
    {
        UniChatPersonAddr = uniChatPersonAddr;
        return true;
    }

    function personSendMessageToGroup(
        address group,
        string memory content,
        uint32 typeNumber
    ) public override returns (bool) {
        IUniChatMessage uniChatMessage = IUniChatMessage(UniChatMessageAddr);
        (, uint256 messageId) =
            uniChatMessage.createMessage(
                msg.sender,
                group,
                content,
                typeNumber
            );
        IUniChatGroup uniChatGroup = IUniChatGroup(UniChatGroupAddr);
        uniChatGroup.addMessageId(group, messageId);
        IUniChatPerson uniChatPerson = IUniChatPerson(UniChatPersonAddr);
        uniChatPerson.addMessageId(msg.sender, messageId);
        return true;
    }

    function getMessageIdsByPerson(address person)
        public
        view
        override
        returns (uint256[] memory)
    {
        IUniChatPerson uniChatPerson = IUniChatPerson(UniChatPersonAddr);
        return uniChatPerson.getMessageIds(person);
    }

    function getMessageIdsByGroup(address group)
        public
        view
        override
        returns (uint256[] memory)
    {
        IUniChatGroup uniChatGroup = IUniChatGroup(UniChatGroupAddr);
        return uniChatGroup.getMessageIds(group);
    }

    function getMessageByMessageId(uint256 messageId)
        public
        view
        override
        returns (
            address,
            address,
            string memory,
            uint32,
            uint256
        )
    {
        IUniChatMessage UniChatMessage = IUniChatMessage(UniChatMessageAddr);
        return UniChatMessage.getMessageById(messageId);
    }

    // function isAllowedCaller() public view returns (bool) {
    //     IUniChatMessage uniChatMessage = IUniChatMessage(UniChatMessageAddr);
    //     if(uniChatMessage.isAllowedCaller(this)==false){
    //         return false;
    //     }
    //     IUniChatGroup uniChatGroup = IUniChatGroup(UniChatGroupAddr);
    //     if(uniChatGroup.isAllowedCaller(this)==false){
    //         return false;
    //     }
    //     IUniChatPerson uniChatPerson = IUniChatPerson(UniChatPersonAddr);
    //     if(uniChatPerson.isAllowedCaller(this)==false){
    //         return false;
    //     }
    //     return true;
    // }
}
