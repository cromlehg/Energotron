
import ether from './helpers/ether'
import {advanceBlock} from './helpers/advanceToBlock'
import {increaseTimeTo, duration} from './helpers/increaseTime'
import latestTime from './helpers/latestTime'
import EVMThrow from './helpers/EVMThrow'

const BigNumber = web3.BigNumber

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should()

const PreTGE = artifacts.require('PreTGE')

contract('PreTGE', function(wallets) {

  const notOwner = wallets[1]

  const newAddr = wallets[2]

  before(async function() {
    //Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock()
  })

  beforeEach(async function () {
    this.preTGE = await PreTGE.new()
  })

  // ----------------------------------------------------------------------------------------------
  describe('not owner reject tests', function () {
  // ----------------------------------------------------------------------------------------------

      it('setPeriod reject if not owner', async function () {
        await this.preTGE.setPeriod(1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('setNextSaleAgent reject if not owner', async function () {
        await this.preTGE.setNextSaleAgent(newAddr, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('createTokens reject if not owner', async function () {
        await this.preTGE.createTokens({from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('finish reject if not owner', async function () {
        await this.preTGE.finish({from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

  })

})
