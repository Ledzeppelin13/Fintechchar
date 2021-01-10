// SPDX-License-Identifier: <SPDX-License>
pragma solidity ^0.5.16;

contract Adoption {
    address[16] public adopters;

    function adopt(uint kidId) public returns (uint) {
        require(kidId >= 0 && kidId <=15);
        adopters[kidId] = msg.sender;
        return kidId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
