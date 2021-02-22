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

    address[] public stakers;
    mapping (address => uint) public stakingBalance;
    mapping (address => bool) public hasStaked;
    mapping (address => bool) public isStaking;

    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        dappToken = _dappToken;
        daiToken = _daiToken;
    }

    //1. Stakes Tokens (Deposit)
    function stakeTokens(uint _amount) public {
         //Transfer Mock Dai to this contract for staking
        daiToken.transferFrom(msg.sender, address(this), _amount);
         // update staking balance
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

         // add user to stakers array *only* if they haven't staked yet
         if(!hasStaked[msg.sender]) {
             stakers.push(msg.sender);
         }
        //update staking status
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }
    //2.Unstake Tokens (Withdraw)

    //3.Issuing Tokens 
}
