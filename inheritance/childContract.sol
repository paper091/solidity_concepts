// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./parentContract.sol";

contract B is A{
    function setNum(uint256 _num) public override{
        num = _num + 5;
    }
}
