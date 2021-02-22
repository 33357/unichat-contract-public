// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

import "./interfaces/IUniChatMessage.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "../libraries/AcceptedCaller.sol";

contract UniChatMessage is IUniChatMessage,AcceptedCaller{
    using SafeMath for uint256;

    struct Message {
        address sender;
        address group;
        string content;
        uint32 typeNumber;
        uint256 createDate;
    }

    mapping(uint256 => Message) messages;
    uint256 messagesLength;

    function createMessage(
        address sender,
        address group,
        string memory content,
        uint32 typeNumber
    ) external onlyAcceptedCaller override returns (bool, uint256) {
        uint256 messageId = messagesLength;
        messagesLength = messagesLength.add(1);
        messages[messageId] = Message(
            sender,
            group,
            content,
            typeNumber,
            block.timestamp
        );
        emit MessageCreated(
            messageId,
            sender,
            group,
            content,
            typeNumber,
            block.timestamp
        );
        return (true, messageId);
    }

    function getMessagesLength() external view override returns (uint256) {
        return (messagesLength);
    }

    function getMessageById(uint256 messageId)
        external
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
        return (
            messages[messageId].sender,
            messages[messageId].group,
            messages[messageId].content,
            messages[messageId].typeNumber,
            messages[messageId].createDate
        );
    }
}
