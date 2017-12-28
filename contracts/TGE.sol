pragma solidity ^0.4.18;

import './StagedTokenEvent.sol';


contract TGE is StagedTokenEvent {

  address public foundersTokensWallet;

  address public bountyTokensWallet;

  uint public foundersTokensPercent;

  uint public bountyTokensPercent;

  function setFoundersTokensWallet(address newFoundersTokensWallet) public onlyOwner {
    foundersTokensWallet = newFoundersTokensWallet;
  }

  function setFoundersTokensPercent(uint newFoundersTokensPercent) public onlyOwner {
    foundersTokensPercent = newFoundersTokensPercent;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }

  function calculateTokens(uint investedInWei) public view returns(uint) {
    return investedInWei.mul(price).mul(STAGES_PERCENT_RATE).div(STAGES_PERCENT_RATE.sub(getDiscount())).div(1 ether);
  }

  function finish() public onlyOwner {
    uint256 totalSupply = token.totalSupply();
    uint summaryExtraPercent = bountyTokensPercent.add(foundersTokensPercent);
    uint allTokens = totalSupply.mul(PERCENT_RATE).div(PERCENT_RATE.sub(summaryExtraPercent));
    uint bountyTokens = allTokens.mul(bountyTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(bountyTokensWallet, bountyTokens);
    uint foundersTokens = allTokens.mul(foundersTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(foundersTokensWallet, foundersTokens);
    token.finishMinting();
  }

  function createTokens() public payable canMint {
    wallet.transfer(msg.value);
    calculateAndTransferTokensWithReferer(msg.sender, msg.value);
  }

}
