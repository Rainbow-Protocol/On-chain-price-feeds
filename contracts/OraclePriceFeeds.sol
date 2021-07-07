pragma solidity >=0.8.0;

import "./SafeMath.sol";
import "./AggregatorV3Interface.sol";


contract OraclePriceFeeds {

    using SafeMath for uint256;
    address public owner;

    //token == token-usdt
    mapping(address => address) public feedsManager;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function setFeedAddressManager(address tokenAddress,address feedAddress) public onlyOwner{
       require(tokenAddress != address(0),"setFeedAddressManager tokenAddress error .");
       require(feedAddress != address(0),"setFeedAddressManager feedAddress error .");
       feedAddressManager[tokenAddress] = feedAddress;
    }
    
    //srcToken contains weth
    function getPriceTokenToUsdt(address srcTokenAddress) public view returns(uint256,uint256){
        address feedAddress = feedAddressManager[srcTokenAddress];
        if(feedAddress == address(0)){
            return(0,0);
        }
        AggregatorV3Interface priceFeed = AggregatorV3Interface(feedAddress);
        (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )   = priceFeed.latestRoundData();
        return (10,answer);
    }

}