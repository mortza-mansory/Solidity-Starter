const SendingTokens = artifacts.require("SendingTokens");

module.exports = function (deployer) {
  deployer.deploy(SendingTokens);
};