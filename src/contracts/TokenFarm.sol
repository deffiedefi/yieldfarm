pragma solidity^0.5.0;

import "./DappToken.sol";
import "./DaiToken.sol";
// declare what version of solidity we're using
contract TokenFarm {
    // All code goes here...
    // Declare string name
    string public name = "TokenFarm";
    address public owner;
    DappToken public dappToken;
    DaiToken public daiToken;

    address[] public stakers;
    mapping (address => uint) public stakingBalance;
    mapping (address => bool) public hasStaked;
    mapping (address => bool) public isStaking;

    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        dappToken = _dappToken;
        daiToken = _daiToken;
        owner = msg.sender;
    }

    //1. Stakes Tokens (Deposit)
    function stakeTokens(uint _amount) public {
    
    require(_amount > 0, "amount cannot be 0");
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
    function unstakeTokens() public {

        uint balance = stakingBalance[msg.sender];

        require(balance > 0, "staking balance cannot be 0");

        daiToken.transfer(msg.sender, balance);

        stakingBalance[msg.sender] = 0;

        isStaking[msg.sender] = false;
    }
    //*** UPDATE STAKING BALANCE ^^^ ***
    //3.Issuing Tokens
    function issueTokens() public {
        // owner is the only one to call the funciton
        require(msg.sender == owner, "caller must be the owner");
        // issue tokens to all stakers
        for (uint i=0; i<stakers.length; i++) {
            address recipient = stakers[i];
            uint balance = stakingBalance[recipient];
            if(balance > 0 ) {
                 dappToken.transfer(recipient, balance);
            }
        }
    }
}
