pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './math/SafeMath.sol';
import './EnergotronToken.sol';


contract CommonTokenEvent is Ownable {

  using SafeMath for uint;

  uint public constant PERCENT_RATE = 100;

  uint public price;

  uint public start;

  uint public period;

  uint public minPurchaseLimit;

  uint public minted;

  uint public hardcap;

  uint public invested;

  uint public refererPercent;

  address public directMintAgent;

  address public wallet;

  EnergotronToken public token;

  modifier canMint() {
    require(now >= start && now < lastSaleDate() && msg.value >= minPurchaseLimit && minted < hardcap);
    _;
  }

  modifier onlyDirectMintAgentOrOwner() {
    require(directMintAgent == msg.sender || owner == msg.sender);
    _;
  }

  function sendRefererTokens(uint tokens) internal {
    if (msg.data.length == 20) {
      address referer = bytesToAddres(bytes(msg.data));
      require(referer != address(token) && referer != msg.sender);
      uint refererTokens = tokens.mul(refererPercent).div(PERCENT_RATE);
      mintAndSendTokens(referer, refererTokens);
    }
  }

  function bytesToAddres(bytes source) internal pure returns(address) {
    uint result;
    uint mul = 1;
    for (uint i = 20; i > 0; i--) {
      result += uint8(source[i-1])*mul;
      mul = mul*256;
    }
    return address(result);
  }

  function setHardcap(uint newHardcap) public onlyOwner {
    hardcap = newHardcap;
  }

  function setToken(address newToken) public onlyOwner {
    token = EnergotronToken(newToken);
  }

  function setRefererPercent(uint newRefererPercent) public onlyOwner {
    refererPercent = newRefererPercent;
  }

  function setStart(uint newStart) public onlyOwner {
    start = newStart;
  }

  function setPrice(uint newPrice) public onlyOwner {
    price = newPrice;
  }

  function lastSaleDate() public view returns(uint) {
    return start + period * 1 days;
  }

  function setMinPurchaseLimit(uint newMinPurchaseLimit) public onlyOwner {
    minPurchaseLimit = newMinPurchaseLimit;
  }

  function setWallet(address newWallet) public onlyOwner {
    wallet = newWallet;
  }

  function setDirectMintAgent(address newDirectMintAgent) public onlyOwner {
    directMintAgent = newDirectMintAgent;
  }

  function directMint(address to, uint investedWei) public onlyDirectMintAgentOrOwner {
    calculateAndTransferTokens(to, investedWei);
  }

  function mintAndSendTokens(address to, uint amount) internal {
    token.mint(to, amount);
    minted = minted.add(amount);
  }

  function calculateAndTransferTokens(address to, uint investedInWei) internal returns(uint) {
    uint tokens = calculateTokens(investedInWei);
    mintAndSendTokens(to, tokens);
    invested = invested.add(investedInWei);
    return tokens;
  }

  function calculateAndTransferTokensWithReferer(address to, uint investedInWei) internal {
    uint tokens = calculateAndTransferTokens(to, investedInWei);
    sendRefererTokens(tokens);
  }

  function calculateTokens(uint investedInWei) public view returns(uint);

  function createTokens() public payable;

  function() external payable {
    createTokens();
  }

  function retrieveTokens(address to, address anotherToken) public onlyOwner {
    ERC20 alienToken = ERC20(anotherToken);
    alienToken.transfer(to, alienToken.balanceOf(this));
  }

}
