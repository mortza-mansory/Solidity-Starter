const SendingTokens = artifacts.require("SendingTokens");

contract("SendingTokens", (accounts) => {
  let instance;

  before(async () => {
    console.log("Accounts:", accounts); // Debug accounts
    instance = await SendingTokens.new({ gas: 5000000 }); // Lower gas for testing
    console.log("Contract deployed at:", instance.address); // Debug contract address
  });

  it("should deploy and emit event", async () => {
    const tx = await instance.sendTokens(accounts[1], 100, { from: accounts[0], gas: 200000 });
    
    // Log event details
    console.log("TokensSent Event:", {
      event: tx.logs[0].event,
      from: tx.logs[0].args.from,
      to: tx.logs[0].args.to,
      amount: tx.logs[0].args.amount.toString()
    });
    
    assert.equal(tx.logs.length, 1, "Event was not emitted");
    assert.equal(tx.logs[0].event, "TokensSent", "Incorrect event name");
    assert.equal(tx.logs[0].args.from, accounts[0], "Incorrect sender");
    assert.equal(tx.logs[0].args.to, accounts[1], "Incorrect recipient");
    assert.equal(tx.logs[0].args.amount.toString(), "100", "Incorrect amount");
  });
});