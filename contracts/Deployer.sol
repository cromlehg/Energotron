pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './EnergotronToken.sol';
import './PreTGE.sol';
import './TGE.sol';


contract Deployer is Ownable {

  EnergotronToken public token;

  PreTGE public preTGE;

  TGE public tge;

  function deploy() public onlyOwner {
    token = new EnergotronToken();

    preTGE = new PreTGE();
    preTGE.setPrice(10000000000000000000000);
    preTGE.setMinPurchaseLimit(100000000000000000);
    preTGE.setHardcap(13400000000000000000000000);
    preTGE.setStart(1518699600);
    preTGE.setPeriod(30);
    preTGE.setWallet(0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A);
    preTGE.setRefererPercent(5);

    tge = new TGE();
    tge.setPrice(8000000000000000000000);
    tge.setMinPurchaseLimit(100000000000000000);
    tge.setHardcap(603000000000000000000000000000);
    tge.setStart(1524229200);
    tge.setWallet(0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A);
    tge.setFoundersTokensWallet(0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111);
    tge.setFoundersTokensPercent(7);
    tge.setBountyTokensWallet(0xDa67155b22973bE05Bcd28c07107b2E17314A1e2);
    tge.setBountyTokensPercent(1);
    tge.addStage(5, 15);
    tge.addStage(5, 10);
    tge.addStage(5, 5);
    tge.addStage(15, 0);
    tge.setRefererPercent(5);

    preTGE.setToken(token);
    tge.setToken(token);
    preTGE.setNextSaleAgent(tge);
    token.setSaleAgent(preTGE);

    address newOnwer = 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1;
    token.transferOwnership(newOnwer);
    preTGE.transferOwnership(newOnwer);
    tge.transferOwnership(newOnwer);
  }

}
