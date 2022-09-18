// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// importing the chainlink interface from github using npm
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library conversion{

    // this function returns the current price of eth/usd with 1e18 decimal places
    function getCurrentPrice(uint256 e) internal view returns(uint256){
        // initialising the AggregatorV3Interface object with the eth/usd pair contract address
        AggregatorV3Interface priceTicker = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price, , , ) = priceTicker.latestRoundData();
        return uint256(price*1e10);
    }


    // this function returns the eth equivalent of given usd amount
    // the eth equivalent is returned in two parts; integral part and decimal part separately
    // the decimal part contains 18 decimal values
    function usdToEth(uint256 USD) internal view returns(uint256, uint256){
        uint ethPrice = getCurrentPrice(1);
        USD = USD * 1e36;
        uint256 value = USD/ethPrice;
        uint256 integralPart = value/1e18;
        uint256 decimalPart = value - (integralPart*1e18);
        return (integralPart, decimalPart);
    }
}