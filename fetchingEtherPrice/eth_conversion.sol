// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ethConversions{

    AggregatorV3Interface internal priceTicker;
    
    constructor(){
        priceTicker = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
            // 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    function getCurrentPrice() public view returns(uint256){
        (, int256 price, , , ) = priceTicker.latestRoundData();
        return uint256((price*1e10)/1e18);
    }
}

// Contract deployed on Goerli testnet
// 0x4095fE4f26Df086f31b3CC44820e51c6C0EcC2D9