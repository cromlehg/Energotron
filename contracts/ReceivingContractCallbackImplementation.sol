pragma solidity ^0.4.18;

import './ReceivingContractCallback.sol';
import './ownership/Ownable.sol';
import './EnergotronToken.sol';


contract ReceivingContractCallbackImplementation is ReceivingContractCallback, Ownable {

  EnergotronToken public token;

  function setToken(address newToken) public onlyOwner {
    token = EnergotronToken(newToken);
  }

  function tokenFallback(address _from, uint _value) public {
    token.transfer(0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A, _value);
  }

}
