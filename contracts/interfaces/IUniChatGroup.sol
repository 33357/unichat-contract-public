// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

interface IUniChatGroup {
    //event GroupCreated(address indexed group,string name,address[] indexed tokens ,uint[] balances,bool isPublic,address indexed manager);
    //event SetGroupManager(group, manager);(address indexed group,string name,address[] indexed tokens ,uint[] balances,bool isPublic,address indexed manager);

    //function createGroup(address group,string memory name,address[] memory tokens ,uint[] memory balances,bool isPublic) external returns (bool);
    //function setGroupManager(address group,address manager) external returns (bool);
    function addMessageId(address group, uint256 messageId) external returns (bool);

    function getMessageIds(address group)
        external
        view
        returns (uint256[] memory);
}
