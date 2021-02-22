// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

interface IUniChatMessage {
    event MessageCreated(
        uint256 messageId,
        address sender,
        address group,
        string content,
        uint32 typeNumber,
        uint256 createDate
    );

    function createMessage(
        address sender,
        address group,
        string memory content,
        uint32 typeNumber
    ) external returns (bool,uint256);

    function getMessagesLength() external view returns (uint256);

    function getMessageById(uint256 messageId)
        external
        view
        returns (
            address,
            address,
            string memory,
            uint32,
            uint256
        );
}
