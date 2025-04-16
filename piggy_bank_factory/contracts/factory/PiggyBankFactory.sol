// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "../template/PiggyBank.sol";
import "../interface/IERC20.sol";

error NOT_AUTHORIZED();
error INSUFFICIENT_FUND();
error WITHDRAW_FAILED();
// error REQUIRED_CONTRACT_ADDRESS();

contract PiggyBankFactory {
  address private owner;
  address[] public contractCreatedList;
  mapping(address => ContractInfo[]) public contractInfos;

  struct ContractInfo {
    string purpose;
    uint256 duration;
    address contractAddress;
  }

  event Deployed(address indexed, uint256);
  event Withdrawn(address indexed, uint256);

  constructor() {
    owner = msg.sender;
  }

  function getByteCode(address[] memory _tokens, uint256 _duration, string memory _purpose, address _owner) public view returns(bytes memory) {
    bytes memory bytecode = type(PiggyBank).creationCode;
    return abi.encodePacked(bytecode, abi.encode(_tokens, _duration, _purpose, _owner, address(this)));
  }

  function getAddress(bytes memory bytecode, uint _salt) external view returns(address) {
    // address = keccak256(0xff ++ deployingAddress ++ salt ++ keccak256(bytecode))[12:]

    // bytes memory bytecode = getByteCode(_tokens, _duration, _purpose, msg.sender);

    bytes32 hash = keccak256(
      abi.encodePacked(
        bytes1(0xff),
        address(this),
        _salt,
        keccak256(bytecode)
      )
    );
    return address(uint160(uint256(hash)));
  }

  function createPiggyBank(
    address[] memory _tokens, 
    uint256 _duration, 
    string memory _purpose,
    uint _salt
    ) external {
    address pgAddr;
    // PiggyBank pgBank = new PiggyBank(_tokens, _duration, _purpose, msg.sender);

    bytes memory bytecode = getByteCode(_tokens, _duration, _purpose, msg.sender);
    assembly {
      pgAddr := create2(
        callvalue(),
        add(bytecode, 0x20),
        mload(bytecode),
        _salt
      )
      if iszero(extcodesize(pgAddr)){
        revert (0, 0)
      }
    }

    contractCreatedList.push(pgAddr);

    ContractInfo memory contractInfo;
    // contractInfo.purpose = _purpose;
    contractInfo.purpose = _purpose;
    contractInfo.duration = _duration;
    contractInfo.contractAddress = address(pgAddr);
    
    contractInfos[msg.sender].push(contractInfo);

    emit Deployed(pgAddr, _salt);
  }

  function withdraw(address _token) external {
    if(msg.sender != owner) revert NOT_AUTHORIZED();
    if(_token.code.length == 0) revert REQUIRED_CONTRACT_ADDRESS();

    uint256 amount = IERC20(_token).balanceOf(address(this));
    
    if(amount <= 0) revert INSUFFICIENT_FUND();

    if(!IERC20(_token).transfer(msg.sender, amount)) revert WITHDRAW_FAILED();

    emit Withdrawn(msg.sender, amount);
  }

  function getOwner() external view returns(address) {
    return owner;
  }

  function getTotalContractCount() external view returns(uint256) {
    return contractCreatedList.length;
  }

  function getUserContractCount(address user) external view returns(uint256) {
    return contractInfos[user].length;
  }
}