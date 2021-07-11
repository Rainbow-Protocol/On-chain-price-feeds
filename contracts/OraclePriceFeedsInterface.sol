pragma solidity 0.6.0;

interface OraclePriceFeeds {
    function getPriceTokenToUsdt(address srcTokenAddress) external view returns(uint256 isValid, uint256 lastPrice);
}


