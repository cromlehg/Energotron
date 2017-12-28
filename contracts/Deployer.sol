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
    preTGE.setWallet(0xDFDCAc0c9Eb45C63Bcff91220A48684882F1DAd0);
    preTGE.setRefererPercent(5);

    tge = new TGE();
    tge.setPrice(8000000000000000000000);
    tge.setMinPurchaseLimit(100000000000000000);
    tge.setHardcap(603000000000000000000000000000);
    tge.setStart(1524229200);
    tge.setWallet(0x3aC45b49A4D3CB35022fd8122Fd865cd1B47932f);
    tge.setFoundersTokensWallet(0xF0e830148F3d1C4656770DAa282Fda6FAAA0Fe0B);
    tge.setFoundersTokensPercent(7);
    tge.setBountyTokensWallet(0xF0e830148F3d1C4656770DAa282Fda6FAAA0Fe0B);
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

    address newOnwer = 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0;
    token.transferOwnership(newOnwer);
    preTGE.transferOwnership(newOnwer);
    tge.transferOwnership(newOnwer);
  }

}
