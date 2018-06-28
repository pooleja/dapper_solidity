/* global artifacts, contract, it, assert */
var Sample = artifacts.require('./Sample.sol')

contract('Sample', function (accounts) {
  it('should track modifiers', async () => {
    let instance = await Sample.deployed()

    console.log({ instanceAddress: instance.address })

    let didAddressOneModify = await instance.didModify.call(accounts[0])
    assert.equal(
      didAddressOneModify,
      false,
      'Should start out as not modified by account 0'
    )

    // Double it
    await instance.increase({ from: accounts[0] })

    didAddressOneModify = await instance.didModify.call(accounts[0])
    assert.equal(
      didAddressOneModify,
      true,
      'Should now be modified by account 0'
    )
  })
})
