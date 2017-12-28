pragma solidity ^0.4.18;

import './token/StandardToken.sol';
import './ownership/Ownable.sol';
import './ReceivingContractCallback.sol';


contract EnergotronToken is StandardToken, Ownable {

  event Mint(address indexed to, uint256 amount);

  event MintFinished();

  string public constant name = 'Energotron';

  string public constant symbol = 'ETN';

  uint32 public constant decimals = 18;

  bool public mintingFinished = false;

  address public saleAgent;

  mapping(address => uint) public locked;

  mapping(address => bool) public authorized;

  mapping(address => bool)  public registeredCallbacks;

  modifier notLocked() {
    require(msg.sender == owner || msg.sender == saleAgent || (mintingFinished && now >= locked[msg.sender]));
    _;
  }

  function lock(address to, uint periodInDays) public {
    require((msg.sender == saleAgent || msg.sender == owner) && !mintingFinished);
    locked[to] = now + periodInDays * 1 days;
  }

  function transfer(address _to, uint256 _value) public notLocked returns (bool) {
    return processCallback(super.transfer(_to, _value), msg.sender, _to, _value);
  }

  function transferFrom(address from, address to, uint256 value) public notLocked returns (bool) {
    return processCallback(super.transferFrom(from, to, value), from, to, value);
  }

  function setSaleAgent(address newSaleAgent) public {
    require(saleAgent == msg.sender || owner == msg.sender);
    saleAgent = newSaleAgent;
  }

  function mint(address _to, uint256 _amount) public returns (bool) {
    require(!mintingFinished);
    require(msg.sender == saleAgent);
    totalSupply = totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    Mint(address(0), _amount);
    Transfer(address(0), _to, _amount);
    return true;
  }

  function finishMinting() public returns (bool) {
    require(!mintingFinished);
    require(msg.sender == owner || msg.sender == saleAgent);
    mintingFinished = true;
    MintFinished();
    return true;
  }

  function registerCallback(address callback) public onlyOwner {
    registeredCallbacks[callback] = true;
  }

  function deregisterCallback(address callback) public onlyOwner {
    registeredCallbacks[callback] = false;
  }

  function processCallback(bool result, address from, address to, uint value) internal returns(bool) {
    if (result && registeredCallbacks[to]) {
      ReceivingContractCallback targetCallback = ReceivingContractCallback(to);
      targetCallback.tokenFallback(from, value);
    }
    return result;
  }

}
