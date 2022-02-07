const { expect } = require("chai");
//DeFi Test
/*
describe("Safe Storage contract", function () {
//   let Token;
//   let testContract;
//   let owner;
//   let addr1;
//   let addr2;
//   let addrs;
    let contractAddr;
  beforeEach(async function () {
    Safe = await ethers.getContractFactory("SafeStorage");
    [contractAddr] = await ethers.getSigners();
    testContract = await Safe.deploy();
  });
    let owner = "0x9EfBDc0bE3b154EC193fE402640D2343e1EC4980";
    let token = "0xc41B5E5f8EBa25c77B38aaf01AcC62eE7d4E5F30";
    describe("GetBalance Test", function(){
        it("Owner's Balance", async function(){
            expect(await testContract.getBalance(token,owner));
        })
    });

    describe("Deposit 5 token", function(){
        it("Deposit 5 token in contract", async function(){
            await testContract.deposit(token,5);
            expect(await testContract.getMyStorageBalance(contractAddr)).to.equal(5);
        })
    });
});
*/

//DEX Test
describe("Token contract", function () {
    let Token = '0xc41B5E5f8EBa25c77B38aaf01AcC62eE7d4E5F30';
    let hardhatToken;
    let owner = '0x9EfBDc0bE3b154EC193fE402640D2343e1EC4980';
    let addr1;
    let addr2;
    let addrs;
  
    beforeEach(async function () {
      Token = await ethers.getContractFactory("Test");
    //   [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
      hardhatToken = await Token.deploy();
    });
  
    // describe("Deployment", function () {
    //   it("Should set the right owner", async function () {
    //     expect(await hardhatToken.owner()).to.equal(owner.address);
    //   });
    // });
    describe("Transaction", function(){
        it("Get Balance Test", async function(){
            await hardhatToken.getBalance(Token,owner);
            console.log(await hardhatToken.getBalance(Token,owner));
        });
        it("Get ERC20 Token Test", async function(){
            console.log(await hardhatToken.getERC20Token(Token,owner));
        })
    });
});