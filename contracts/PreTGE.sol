pragma solidity ^0.4.18;

import './CommonTokenEvent.sol';


contract PreTGE is CommonTokenEvent {

  address public nextSaleAgent;

  function setPeriod(uint newPeriod) public onlyOwner {
    period = newPeriod;
  }

  function calculateTokens(uint investedInWei) public view returns(uint) {
    return investedInWei.mul(price).div(1 ether);
  }

  function setNextSaleAgent(address newNextSaleAgent) public onlyOwner {
    nextSaleAgent = newNextSaleAgent;
  }

  function createTokens() public payable canMint {
    wallet.transfer(msg.value);
    calculateAndTransferTokensWithReferer(msg.sender, msg.value);
  }

  function finish() public onlyOwner {
    token.setSaleAgent(nextSaleAgent);
  }

}
