// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

interface IUniChatPerson {
    //event PersonCreated(address indexed owner, string name);
    //event setPersonName(address indexed owner, string name);

    //function createPerson(string memory name) external returns (bool);
    //function setPersonName(string memory name) external returns (bool);
    function addMessageId(address person, uint256 messageId)
        external
        returns (bool);

    //function getPerson(address wallet) external view returns (string memory,address[] memory,uint[] memory,address);
    function getMessageIds(address person)
        external
        view
        returns (uint256[] memory);
}
