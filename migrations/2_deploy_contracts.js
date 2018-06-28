/* global artifacts */
var SampleLib = artifacts.require('./SampleLib.sol')
var Sample = artifacts.require('./Sample.sol')

module.exports = function (deployer) {
  deployer.deploy(SampleLib)
  deployer.link(SampleLib, Sample)
  deployer.deploy(Sample)
}
