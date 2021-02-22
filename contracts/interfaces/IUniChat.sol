// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

interface IUniChat {
    function personSendMessageToGroup(
        address group,
        string memory content,
        uint32 typeNumber
    ) external returns (bool);

    function getMessageIdsByPerson(address person)
        external
        view
        returns (uint256[] memory);

    function getMessageIdsByGroup(address group)
        external
        view
        returns (uint256[] memory);

    function getMessageByMessageId(uint256 messageId)
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
