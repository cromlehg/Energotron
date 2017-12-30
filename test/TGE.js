
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

const TGE = artifacts.require('TGE')

contract('TGE', function(wallets) {

  const notOwner = wallets[1]

  const newAddr = wallets[2]

  before(async function() {
    //Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock()
  })

  beforeEach(async function () {
    this.TGE = await TGE.new()
  })

  // ----------------------------------------------------------------------------------------------
  describe('not owner reject tests', function () {
  // ----------------------------------------------------------------------------------------------

      it('finish reject if not owner', async function () {
        await this.TGE.finish({from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('createTokens reject if not owner', async function () {
        await this.TGE.createTokens({from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('setStart reject if not owner', async function () {
        await this.TGE.setStart(1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('setPrice reject if not owner', async function () {
        await this.TGE.setPrice(1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('addStage reject if not owner', async function () {
        await this.TGE.addStage(1, 1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('removeStage reject if not owner', async function () {
        await this.TGE.removeStage(1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('changeStage reject if not owner', async function () {
        await this.TGE.changeStage(1, 1, 1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('insertStage reject if not owner', async function () {
        await this.TGE.insertStage(1, 1, 1, {from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

      it('clearStages reject if not owner', async function () {
        await this.TGE.clearStages({from: notOwner}).should.be.rejectedWith(EVMThrow)
      })

  })

})
