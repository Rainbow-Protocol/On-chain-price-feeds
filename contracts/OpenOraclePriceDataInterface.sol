pragma solidity >=0.8.0;

interface OpenOraclePriceData {
    function getPriceTokenToUsdt(address srcTokenAddress) external view returns(uint256 isValid, uint256 lastPrice);
}


