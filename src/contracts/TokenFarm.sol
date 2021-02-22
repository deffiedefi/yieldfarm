pragma solidity^0.5.0;

import "./DappToken.sol";
import "./DaiToken.sol";
// declare what version of solidity we're using
contract TokenFarm {
    // All code goes here...
    // Declare string name
    string public name = "TokenFarm";
    DappToken public dappToken;
    DaiToken public daiToken;

    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        dappToken = _dappToken;
        daiToken = _daiToken;
    }
}
