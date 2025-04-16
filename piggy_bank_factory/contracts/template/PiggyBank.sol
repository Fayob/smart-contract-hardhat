// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "../interface/IERC20.sol";

error REQUIRED_CONTRACT_ADDRESS();
error INVALID_DURATION();
error INVALID_ADDRESS();
error DEPOSIT_FAILED();
error ONLY_OWNER_IS_AUTHORIZED();
error ADDRESS_NOT_ACCEPTED();
error INVALID_AMOUNT();
error NOT_AN_ACCEPTED_TOKEN();
error PIGGY_BANK_NO_LONGER_ACCEPT_FUND();
error INSUFFICIENT_BALANCE();
error NOT_ENOUGH_FUND();
error NOT_YET_TIME_TO_WITHDRAW_UNLESS_EMERGENCY_WITHDRAWAL();
error WITHDRAWAL_FAILED();
error ERC20_TRANSFER_FAILED();

contract PiggyBank {
  string public purpose;
  uint256 public deadline;
  bool private hasDestroy;
  address public owner;
  address private devAddress;

  address private constant usdcAddress = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
  // address private constant usdcAddress = 0xb1B83B96402978F212af2415b1BffAad0D2aF1bb;
  address private constant usdtAddress = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
  address private constant daiAddress = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
  
  mapping(address => bool) public acceptedTokens;
  mapping(address => uint256) public balance;

  event Deposited(address indexed, address indexed, uint256);
  event Withdrawn(address indexed, address indexed, uint256);

  constructor(address[] memory _tokens, uint256 _duration, string memory _purpose, address _owner, address _devAddress){
    if(_duration <= 0) revert INVALID_DURATION();
    if(_owner == address(0)) revert INVALID_ADDRESS();

    deadline = block.timestamp + _duration;
    purpose = _purpose;
    owner = _owner;
    devAddress = _devAddress;

    setTokens(_tokens);
  }

  function setTokens(address[] memory _tokens) private {
    if (_tokens.length <= 3) {
      for(uint8 i = 0; i < _tokens.length; i++) {
          // if(_tokens[i].code.length == 0) revert REQUIRED_CONTRACT_ADDRESS();
          if(_tokens[i] == address(0) && i != _tokens.length - 1) continue;
          if(_tokens[i] != usdcAddress && _tokens[i] != usdtAddress && _tokens[i] != daiAddress) revert ADDRESS_NOT_ACCEPTED();
          acceptedTokens[_tokens[i]] = true;
        }
    } else {
      for(uint8 i = 0; i < 3; i++) {
        // if(_tokens[i].code.length == 0) revert REQUIRED_CONTRACT_ADDRESS();
        if(_tokens[i] == address(0) && i != 2) continue;
        if(_tokens[i] != usdcAddress && _tokens[i] != usdtAddress && _tokens[i] != daiAddress) revert ADDRESS_NOT_ACCEPTED();
        acceptedTokens[_tokens[i]] = true;
      }
    }
  }

  modifier onlyOwner() {
    if(msg.sender != owner) revert ONLY_OWNER_IS_AUTHORIZED();
    _;
  }

  modifier requireContractToken(address _token) {
    if(_token.code.length == 0) revert REQUIRED_CONTRACT_ADDRESS();
    _;
  }

  function deposit(address _token, uint256 _amount) external {
    if(!acceptedTokens[_token]) revert NOT_AN_ACCEPTED_TOKEN();
    if(_amount <= 0) revert INVALID_AMOUNT();
    if(hasDestroy) revert PIGGY_BANK_NO_LONGER_ACCEPT_FUND();
    if(IERC20(_token).balanceOf(msg.sender) < _amount) revert INSUFFICIENT_BALANCE();

    if(IERC20(_token).transferFrom(msg.sender, address(this), _amount)) revert DEPOSIT_FAILED();

    balance[_token] += _amount;

    emit Deposited(msg.sender, _token, _amount);
  }

  function withdraw(address _token) external onlyOwner {
    if(block.timestamp < deadline) revert NOT_YET_TIME_TO_WITHDRAW_UNLESS_EMERGENCY_WITHDRAWAL();
    // if(_to == address(0)) revert INVALID_ADDRESS();
    if(!acceptedTokens[_token]) revert NOT_AN_ACCEPTED_TOKEN();
    if(IERC20(_token).balanceOf(address(this)) <= 0) revert NOT_ENOUGH_FUND();

    uint256 amount = IERC20(_token).balanceOf(address(this));
    // IERC20 erc20Token = IERC20(_token);
    if(!IERC20(_token).transfer(owner, amount)) revert WITHDRAWAL_FAILED();

    balance[_token] = 0;

    emit Withdrawn(owner, _token, amount);

    destroy();
  }

  function preDeadlineWithdrawal(address _token) external onlyOwner() {
    if(!acceptedTokens[_token]) revert NOT_AN_ACCEPTED_TOKEN();
    if(IERC20(_token).balanceOf(address(this)) <= 0) revert NOT_ENOUGH_FUND();

    uint256 amount = IERC20(_token).balanceOf(address(this));
    uint256 penaltyFee = (amount * 15) / 100;
    uint256 withdrawAmount = amount - penaltyFee;

    if (!IERC20(_token).transfer(devAddress, penaltyFee)) revert WITHDRAWAL_FAILED();
    if (!IERC20(_token).transfer(owner, withdrawAmount)) revert WITHDRAWAL_FAILED();

    balance[_token] = 0;

    emit Withdrawn(owner, _token, withdrawAmount);

    destroy();
  }

  function destroy() private {
    if (IERC20(usdcAddress).balanceOf(address(this)) == 0 && 
        IERC20(usdtAddress).balanceOf(address(this)) == 0 &&
        IERC20(daiAddress).balanceOf(address(this)) == 0) 
    {
      hasDestroy = true;
      selfdestruct(payable(owner));
    }
  }

  function getDevAddress() external view returns(address) {
    return devAddress;
  }
}