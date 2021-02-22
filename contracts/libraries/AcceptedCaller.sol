// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AcceptedCaller is Ownable {
    mapping(address => bool) callers;

    event CallerAccepted(address indexed caller);
    event CallerRefused(address indexed caller);

    modifier onlyAcceptedCaller {
        require(callers[msg.sender] == true);
        _;
    }

    function isAcceptedCaller(address caller) public view returns (bool) {
        return callers[caller];
    }

    function AcceptCaller(address caller) public onlyOwner {
        require(callers[caller] == false);
        callers[caller] = true;
        emit CallerAccepted(caller);
    }

    function refuseCaller(address caller) public onlyOwner {
        require(callers[caller] == true);
        callers[caller] = false;
        emit CallerRefused(caller);
    }
}
