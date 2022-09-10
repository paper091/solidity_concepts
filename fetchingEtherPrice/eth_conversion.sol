// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// importing the chainlink interface from github using npm
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract ethConversions{

    AggregatorV3Interface internal priceTicker;
    
    constructor(){
        // initialising the AggregatorV3Interface object with the eth/usd pair contract address
        priceTicker = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    }

    // this function returns the current price of eth/usd with 1e18 decimal places
    function getCurrentPrice() public view returns(uint256){
        (, int256 price, , , ) = priceTicker.latestRoundData();
        return uint256(price*1e10);
    }

    // this function returns the eth equivalent of given usd amount
    // the eth equivalent is returned in two parts; integral part and decimal part separately
    // the decimal part contains 18 decimal values
    function usdToEth(uint USD) public view returns(uint256, uint256){
        uint ethPrice = getCurrentPrice();
        USD = USD * 1e36;
        uint256 value = USD/ethPrice;
        uint256 integralPart = value/1e18;
        uint256 decimalPart = value - (integralPart*1e18);
        return (integralPart, decimalPart);
    }
}