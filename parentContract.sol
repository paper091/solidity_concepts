// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract A{
    uint256 num;
    string name;

    function setNum(uint256 _num) public virtual{
        num = _num;
    }
    function getNum() public view returns(uint256){
        return num;
    }

    function setName(string memory _name) public{
        name = _name;
    }
    function getName() public view returns(string memory){
        return name;
    }
}
