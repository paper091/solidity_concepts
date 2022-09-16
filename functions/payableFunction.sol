// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract fundMe{

    address[] public funders;
    uint256 public len;
    mapping(address => uint256) public fundings;

    function fund() public payable{

        if(fundings[msg.sender] != 0){
            fundings[msg.sender] = fundings[msg.sender] + msg.value;
        }
        else{
            funders.push(msg.sender);
            fundings[msg.sender] = msg.value;
            len = len + 1;
        }
    }  

    function viewFundings() public view returns(address[] memory, uint256[] memory){
        uint256[] memory funds = new uint256[](len);
        for(uint i = 0; i < len; i++){
            uint256 temp = fundings[funders[i]];
            funds[i] = temp;
        }
        return(funders, funds);
    }
}

// simple fundme function